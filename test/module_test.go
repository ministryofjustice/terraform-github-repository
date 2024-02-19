package main

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"regexp"
	"testing"
)

func TestModule(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "./unit-test",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	// Repository

	// Terraform Outputs
	name := terraform.Output(t, terraformOptions, "name")
	description := terraform.Output(t, terraformOptions, "description")
	homepageUrl := terraform.Output(t, terraformOptions, "homepage_url")
	visibility := terraform.Output(t, terraformOptions, "visibility")

	// Assertions
	assert.Regexp(t, regexp.MustCompile(`module-test-repo`), name)
	assert.Regexp(t, regexp.MustCompile(`This repository was created by the terraform github repository unit test`), description)
	assert.Regexp(t, regexp.MustCompile(`https://github.com/ministryofjustice/terraform-github-repository`), homepageUrl)
	assert.Regexp(t, regexp.MustCompile(`public`), visibility)


	// Protection Rules and Actions Variables

	// Terraform Outputs
	branchProtectionPattern := terraform.Output(t, terraformOptions, "branch_protection_pattern")
	tagProtectionPattern := terraform.Output(t, terraformOptions, "tag_protection_pattern")
	testActionsVariableValue := terraform.Output(t, terraformOptions, "test_actions_variable_value")

	// Assertions
	assert.Regexp(t, regexp.MustCompile(`main`), branchProtectionPattern)
	assert.Regexp(t, regexp.MustCompile(`\*`), tagProtectionPattern)
	assert.Regexp(t, regexp.MustCompile(`test`), testActionsVariableValue)


	// Team-Repository Associations
	
	// Terraform outputs
	adminTeamId := terraform.Output(t, terraformOptions, "admin_team_id")
	adminRepository := terraform.Output(t, terraformOptions, "admin_repository")
	adminPermission := terraform.Output(t, terraformOptions, "admin_permission")

	maintainTeamId := terraform.Output(t, terraformOptions, "maintain_team_id")
	maintainRepository := terraform.Output(t, terraformOptions, "maintain_repository")
	maintainPermission := terraform.Output(t, terraformOptions, "maintain_permission")

	pushTeamId := terraform.Output(t, terraformOptions, "push_team_id")
	pushRepository := terraform.Output(t, terraformOptions, "push_repository")
	pushPermission := terraform.Output(t, terraformOptions, "push_permission")

	pullTeamId := terraform.Output(t, terraformOptions, "pull_team_id")
	pullRepository := terraform.Output(t, terraformOptions, "pull_repository")
	pullPermission := terraform.Output(t, terraformOptions, "pull_permission")

	// Assertions
	assert.Regexp(t, regexp.MustCompile(`9494611`), adminTeamId)
	assert.Regexp(t, regexp.MustCompile(`module-test-repo`), adminRepository)
	assert.Regexp(t, regexp.MustCompile(`admin`), adminPermission)

	assert.Regexp(t, regexp.MustCompile(`9456244`), maintainTeamId)
	assert.Regexp(t, regexp.MustCompile(`module-test-repo`), maintainRepository)
	assert.Regexp(t, regexp.MustCompile(`maintain`), maintainPermission)

	assert.Regexp(t, regexp.MustCompile(`9472191`), pushTeamId)
	assert.Regexp(t, regexp.MustCompile(`module-test-repo`), pushRepository)
	assert.Regexp(t, regexp.MustCompile(`push`), pushPermission)

	assert.Regexp(t, regexp.MustCompile(`9494804`), pullTeamId)
	assert.Regexp(t, regexp.MustCompile(`module-test-repo`), pullRepository)
	assert.Regexp(t, regexp.MustCompile(`pull`), pullPermission)
}

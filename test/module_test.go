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

	repositoryName := terraform.Output(t, terraformOptions, "repository_name")
	branchProtectionPattern := terraform.Output(t, terraformOptions, "branch_protection_pattern")
	tagProtectionPattern := terraform.Output(t, terraformOptions, "tag_protection_pattern")
	testActionsVariableValue := terraform.Output(t, terraformOptions, "test_actions_variable_value")

	assert.Regexp(t, regexp.MustCompile(`module-test-repo`), repositoryName)
	assert.Regexp(t, regexp.MustCompile(`main`), branchProtectionPattern)
	assert.Regexp(t, regexp.MustCompile(`\*`), tagProtectionPattern)
	assert.Regexp(t, regexp.MustCompile(`test`), testActionsVariableValue)

	// team-repo associations
	adminTeamId := terraform.Output(t, terraformOptions, "admin_team_id")
	adminRepository := terraform.Output(t, terraformOptions, "admin_repository")
	adminPermission := terraform.Output(t, terraformOptions, "admin_permission")

	assert.Regexp(t, regexp.MustCompile(`test`), adminTeamId)
	assert.Regexp(t, regexp.MustCompile(`module-test-repo`), adminRepository)
	assert.Regexp(t, regexp.MustCompile(`admin`), adminPermission)
}

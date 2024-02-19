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
	githubBranchProtectionPattern := terraform.Output(t, terraformOptions, "github_branch_protection_pattern")
	githubRepositoryTag_protectionPattern := terraform.Output(t, terraformOptions, "github_repository_tag_protection_pattern")
	githubActionsVariableValue := terraform.Output(t, terraformOptions, "github_actions_variable_value")

	assert.Regexp(t, regexp.MustCompile(`^module-test-repo`), repositoryName)
	// assert.Regexp(t, regexp.MustCompile(`^main`), githubBranchProtectionPattern)
	// assert.Regexp(t, regexp.MustCompile(`^*`), githubRepositoryTag_protectionPattern)
	// assert.Regexp(t, regexp.MustCompile(`^test`), githubActionsVariableValue)
}

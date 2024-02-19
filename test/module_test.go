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
	BranchProtectionPattern := terraform.Output(t, terraformOptions, "branch_protection_pattern")
	Tag_protectionPattern := terraform.Output(t, terraformOptions, "tag_protection_pattern")

	assert.Regexp(t, regexp.MustCompile(`^module-test-repo`), repositoryName)
	assert.Regexp(t, regexp.MustCompile(`^main`), BranchProtectionPattern)
	assert.Regexp(t, regexp.MustCompile(`^*`), Tag_protectionPattern)
}

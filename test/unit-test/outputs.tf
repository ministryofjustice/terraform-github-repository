output "repository_name" {
  value = module.module-test-repo.github_repository.default.name 
}

output "github_branch_protection_pattern" {
  value = module.module-test-repo.github_branch_protection.default.pattern
}

output "github_repository_tag_protection_pattern" {
  value = module.module-test-repo.github_repository_tag_protection.default.pattern
}

output "github_actions_variable_value" {
  value = module.module-test-repo.github_actions_variable["TEST_VARIABLE"].default.value
}
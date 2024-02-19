output "repository_name" {
  value = module.module-test-repo.repository.name 
}

output "branch_protection_pattern" {
  value = module.module-test-repo.branch_protection.pattern
}

output "tag_protection_pattern" {
  value = module.module-test-repo.tag_protection.pattern
}

output "test_actions_variable_value" {
  value = module.module-test-repo.actions_variables["TEST_VARIABLE"].value
}
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

# Team-repo associations

output "admin_team_id" {
  value = module.module-test-repo.admins[data.github_team.test_team_one.id].team_id
}

output "admin_repository" {
  value = module.module-test-repo.admins[data.github_team.test_team_one.id].repository
}

output "admin_permission" {
  value = module.module-test-repo.admins[data.github_team.test_team_one.id].permission
}

output "maintain_team_id" {
  value = module.module-test-repo.maintainers[data.github_team.operations_engineering_test.id].team_id
}

output "maintain_repository" {
  value = module.module-test-repo.maintainers[data.github_team.operations_engineering_test.id].repository
}

output "maintain_permission" {
  value = module.module-test-repo.maintainers[data.github_team.operations_engineering_test.id].permission
}
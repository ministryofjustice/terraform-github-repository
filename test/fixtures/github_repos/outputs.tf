# Repository

output "name" {
  value = module.module-test-repo.repository.name 
}

output "description" {
  value = module.module-test-repo.repository.description
}

output "homepage_url" {
  value = module.module-test-repo.repository.homepage_url 
}

output "visibility" {
  value = module.module-test-repo.repository.visibility
}

# Protection Rules and Actions Variables

output "branch_protection_pattern" {
  value = module.module-test-repo.branch_protection.pattern
}

output "test_actions_variable_value" {
  value = module.module-test-repo.actions_variables["TEST_VARIABLE"].value
}

# Team-Repository Associations

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

output "push_team_id" {
  value = module.module-test-repo.pushers[data.github_team.test_team_access.id].team_id
}

output "push_repository" {
  value = module.module-test-repo.pushers[data.github_team.test_team_access.id].repository
}

output "push_permission" {
  value = module.module-test-repo.pushers[data.github_team.test_team_access.id].permission
}

output "pull_team_id" {
  value = module.module-test-repo.pullers[data.github_team.test_team_two.id].team_id
}

output "pull_repository" {
  value = module.module-test-repo.pullers[data.github_team.test_team_two.id].repository
}

output "pull_permission" {
  value = module.module-test-repo.pullers[data.github_team.test_team_two.id].permission
}
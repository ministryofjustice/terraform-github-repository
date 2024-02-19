output "repository_name" {
  value = module.module-test-repo.repository.name 
}

# output "github_branch_protection_pattern" {
#   value = module.module-test-repo.github_branch_protection.default.pattern
# }

# output "github_repository_tag_protection_pattern" {
#   value = module.module-test-repo.github_repository_tag_protection.default.pattern
# }

# output "github_actions_variable_value" {
#   value = module.module-test-repo.github_actions_variable["TEST_VARIABLE"].default.value
# }

# # Repository-Team Associations 

# # admin
# output "github_team_repository_admin_team_id" {
#   value = module.module-test-repo.github_team_repository.admin[data.github_team.test_team_one.id].team_id
# }

# output "github_team_repository_admin_repository" {
#   value = module.module-test-repo.github_team_repository.admin[data.github_team.test_team_one.id].repository
# }

# output "github_team_repository_admin_permission" {
#   value = module.module-test-repo.github_team_repository.admin[data.github_team.test_team_one.id].permission
# }

# # maintain
# output "github_team_repository_maintain_team_id" {
#   value = module.module-test-repo.github_team_repository.maintain[data.github_team.operations_engineering_test.id].team_id
# }

# output "github_team_repository_maintain_repository" {
#   value = module.module-test-repo.github_team_repository.maintain[data.github_team.operations_engineering_test.id].repository
# }

# output "github_team_repository_maintain_permission" {
#   value = module.module-test-repo.github_team_repository.maintain[data.github_team.operations_engineering_test.id].permission
# }

# # push
# output "github_team_repository_push_team_id" {
#   value = module.module-test-repo.github_team_repository.push[data.github_team.test_team_access.id].team_id
# }

# output "github_team_repository_push_repository" {
#   value = module.module-test-repo.github_team_repository.push[data.github_team.test_team_access.id].repository
# }

# output "github_team_repository_push_permission" {
#   value = module.module-test-repo.github_team_repository.push[data.github_team.test_team_access.id].permission
# }

# # pull
# output "github_team_repository_pull_team_id" {
#   value = module.module-test-repo.github_team_repository.pull[data.github_team.test_team_two.id].team_id
# }

# output "github_team_repository_pull_repository" {
#   value = module.module-test-repo.github_team_repository.pull[data.github_team.test_team_two.id].repository
# }

# output "github_team_repository_pull_permission" {
#   value = module.module-test-repo.github_team_repository.pull[data.github_team.test_team_two.id].permission
# }
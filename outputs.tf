output "repository" {
  value = github_repository.default 
}

output "branch_protection" {
  value = github_branch_protection.default 
}

output "tag_protection" {
  value = github_repository_tag_protection.default 
}

output "actions_variables" {
  value = github_actions_variable.default
}

output "admins" {
  value = github_team_repository.admin
}

output "maintainers" {
  value = github_team_repository.maintain
}

output "pushers" {
  value = github_team_repository.push
}

output "pullers" {
  value = github_team_repository.pull
}
output "repository" {
  value = github_repository.default 
}

output "branch_protection" {
  value = github_branch_protection.default 
}

output "tag_protection" {
  value = github_repository_tag_protection.default 
}
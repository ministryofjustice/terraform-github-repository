output "repository_name" {
  description = "Name of the created repository"
  value = github_repository.default.name
}
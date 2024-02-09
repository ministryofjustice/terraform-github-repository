# Repository basics
#tfsec:ignore:github-repositories-private

moved {
  from = github_repository.this
  to   = github_repository.default
}

moved {
  from = github_branch_protection.this
  to   = github_branch_protection.default
}

resource "github_repository" "default" {
  name                   = var.name
  description            = join(" • ", [var.description, "This repository is defined and managed in Terraform"])
  homepage_url           = var.homepage_url
  visibility             = var.visibility
  has_issues             = true
  has_projects           = true
  has_wiki               = var.type == "core" ? true : false
  has_downloads          = true
  has_discussions        = var.has_discussions
  is_template            = var.type == "template" ? true : false
  allow_merge_commit     = true
  allow_squash_merge     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = true
  auto_init              = false
  archived               = false
  archive_on_destroy     = true
  vulnerability_alerts   = true
  topics                 = var.topics

  security_and_analysis {
    dynamic "advanced_security" {
      for_each = var.visibility == "public" ? [] : [1]
      content {
        status = "enabled"
      }
    }
    secret_scanning {
      status = "enabled"
    }
    secret_scanning_push_protection {
      status = "enabled"
    }
  }

  template {
    owner      = "ministryofjustice"
    repository = "template-repository"
  }

  # The `pages.source` block doesn't support dynamic blocks in GitHub provider version 4.3.2,
  # so we ignore the changes so it doesn't try to revert repositories that have manually set
  # their pages configuration.
  lifecycle {
    ignore_changes = [template, pages]
  }
}

#tfsec:ignore:github-branch_protections-require_signed_commits
resource "github_branch_protection" "default" {
  repository_id  = github_repository.default.id
  pattern        = "main"
  enforce_admins = true
  # checkov:skip=CKV_GIT_6:Decision made not to worry about this.
  require_signed_commits = false

  required_status_checks {
    strict   = false
    contexts = var.required_checks
  }

  #checkov:skip=CKV_GIT_5:"moj branch protection guidelines do not require 2 reviews"
  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }
}

resource "github_repository_tag_protection" "default" {
  repository = github_repository.default.id
  pattern    = "*"
}

# Secrets
data "github_actions_public_key" "default" {
  repository = github_repository.default.id
}

resource "github_actions_secret" "default" {
  #checkov:skip=CKV_GIT_4:Although secrets are provided in plaintext, they are encrypted at rest
  for_each        = var.secrets
  repository      = github_repository.default.id
  secret_name     = each.key
  plaintext_value = each.value
}

resource "github_actions_variable" "default" {
  for_each      = var.variables
  repository    = github_repository.default.id
  variable_name = each.key
  value         = each.value
}

resource "github_team_repository" "admin" {
  for_each = var.team_access != null && var.team_access.admin != null ? { for team in var.team_access.admin : team => team } : {}

  team_id    = each.value
  repository = github_repository.this.name
  permission = "admin"
}

resource "github_team_repository" "maintain" {
  for_each = var.team_access != null && var.team_access.maintain != null ? { for team in var.team_access.maintain : team => team } : {}

  team_id    = each.value
  repository = github_repository.this.name
  permission = "maintain"
}

resource "github_team_repository" "push" {
  for_each = var.team_access != null && var.team_access.push != null ? { for team in var.team_access.push : team => team } : {}

  team_id    = each.value
  repository = github_repository.this.name
  permission = "push"
}
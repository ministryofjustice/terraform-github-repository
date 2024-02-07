terraform {
  required_providers {
    github = {
      source                = "integrations/github"
      configuration_aliases = [ github.organisation ]
    }
  }
}
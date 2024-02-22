terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "github" {
  token = var.github_token
  owner = "ministryofjustice-test"
}
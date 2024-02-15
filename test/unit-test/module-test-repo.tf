module "module-test-repo" {
  source  = "ministryofjustice/repository/github"
  version = "0.0.8"

  name            = "module-test-repo"
  description     = "THis repository was created by the terraform github repository unit test"
  homepage_url    = "https://github.com/ministryofjustice/terraform-github-repository"
  has_discussions = true
  topics          = ["operations-engineering"]
  archive_on_destroy = false 
  variables = {
    TEST_VARIABLE = "test"
  }
}
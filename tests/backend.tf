# -------------------------------------------------------------------------------------------------
# Remote State settings
# -------------------------------------------------------------------------------------------------

terraform {
  backend "s3" {
    bucket       = "ci-tf-state-backend-tf-modules"
    key          = "github/teams"
    region       = "eu-central-1"
    use_lockfile = true
    encrypt      = true
    kms_key_id   = "alias/ci-tf-state-backend-tf-modules"
  }
}

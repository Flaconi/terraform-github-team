terraform {
  required_version = ">= 1.0"

  required_providers {
    # https://github.com/integrations/terraform-provider-github
    # https://github.com/flaconi/terraform-provider-github
    # https://github.com/n0rad/terraform-provider-github
    github = {
      source  = "flaconi/github"
      version = "5.13.0-fl.1"
    }
  }
}

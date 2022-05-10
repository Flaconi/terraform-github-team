terraform {
  experiments      = [module_variable_optional_attrs]
  required_version = ">= 1.0"
  required_providers {
    # https://github.com/integrations/terraform-provider-github
    # https://github.com/flaconi/terraform-provider-github
    # https://github.com/n0rad/terraform-provider-github
    github = {
      source  = "flaconi/github"
      version = "4.19.1-fl.4"
    }
  }
}

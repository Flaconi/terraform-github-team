# Terraform GitHub Teams module

Terraform module to create GitHub teams and team memberships.

[![lint](https://github.com/flaconi/terraform-github-team/workflows/lint/badge.svg)](https://github.com/flaconi/terraform-github-team/actions?query=workflow%3Alint)
[![test](https://github.com/flaconi/terraform-github-team/workflows/test/badge.svg)](https://github.com/flaconi/terraform-github-team/actions?query=workflow%3Atest)
[![Tag](https://img.shields.io/github/tag/flaconi/terraform-github-team.svg)](https://github.com/flaconi/terraform-github-team/releases)
[![Terraform](https://img.shields.io/badge/Terraform--registry-github--team-brightgreen.svg)](https://registry.terraform.io/modules/Flaconi/team/github/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

This module ships with a root module that allows you to create a list of teams (including child teams) and their corresponding association.
You can however also just use the bundled sub-modules and wrap your own root module around.


## Important notice

The following must be taken into consideration for initial creation or on re-creation (update operations are not affected):

1. This module will not work when using `terraform apply -parallelism=1`. It must be run in parallel (as is by default).
2. When you have a lot of teams (>50) including multiple nesting levels (>2), it is strongly advised to bump parallelism to a higher value: `terraform apply -parallelism=50` to avoid child teams not being able to find parents.
3. If an increase in parallelism still does not help, you should first define and apply parent teams and then continue with each level. Alternatively you can apply multiple times until it will eventually succeed.

:warning: This module uses a [fork](https://github.com/Flaconi/terraform-provider-github) of official Terraform GitHub provider.


## Features

This module provides the following features without having to re-create teams in a single run as it is able to handle parent/child dependencies automatically:

* Create stand-alone teams
* Create nested teams
* Add member association
* Allows for moving teams up/down a level teams
* Allow for changing team names


## Safe usage

The following has been extensively tested with this module

1. terraform apply from scratch
2. terraform destroy
3. terraform apply with a stand-alone team renamed
4. terraform apply with a parent team renamed team renamed
5. terraform apply with moving a stand-alone team one level up
6. terraform apply with moving a team (which contains childs) one level up


## Example `terraform.tfvars`

```hcl
teams = [
  {
    ident       = "devops"   # The 'ident' is a unique ident to allow restructuring without team re-creation
    name        = "DevOps"
    description = "The DevOps Team"
    privacy     = "secret"
    members     = ["cytopia"]
  },
  {
    ident       = "engineering"
    name        = "Engineering"
    description = "The Engineering Team"
    members     = ["cytopia"]
  },
  {
    ident       = "frontend"
    name        = "Frontend"
    description = "Team Frontend"
    parent_name = "Engineering"
  },
  {
    ident       = "backend"
    name        = "Backend"
    description = "Team Backend"
    parent_name = "Engineering"
  },
]
```

<!-- TFDOCS_HEADER_START -->


<!-- TFDOCS_HEADER_END -->

<!-- TFDOCS_PROVIDER_START -->
## Providers

No providers.

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 6.2.1-fl.1 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

The following input variables are required:

### <a name="input_teams"></a> [teams](#input\_teams)

Description: GitHub teams to manage.

Type:

```hcl
list(object({
    ident       = string                     # Unique identifier for each item to guarantee no re-create during list change
    name        = string                     # Name of the team as displayed on GitHub
    description = optional(string)           # Description of the team
    privacy     = optional(string, "closed") # Privacy (closed or secret), default is closed
    parent_name = optional(string)           # Name of the Parent team
    members     = optional(list(string), []) # List of GitHub usernames to assign to a team
  }))
```

## Optional Inputs

No optional inputs.

<!-- TFDOCS_INPUTS_END -->

<!-- TFDOCS_OUTPUTS_START -->
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_teams"></a> [teams](#output\_teams) | GitHub teams. |

<!-- TFDOCS_OUTPUTS_END -->

## License

**[MIT License](LICENSE)**

Copyright (c) 2022 **[Flaconi GmbH](https://github.com/flaconi)**

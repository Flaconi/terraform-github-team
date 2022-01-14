# Terraform GitHub membership module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 4.19.1-fl.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 4.19.1-fl.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_team_membership.membership](https://registry.terraform.io/providers/flaconi/github/4.19.1-fl.1/docs/resources/team_membership) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_team_id"></a> [team\_id](#input\_team\_id) | GitHub team ID | `number` | n/a | yes |
| <a name="input_members"></a> [members](#input\_members) | GitHub team members (list of GitHub usernames) | `list(string)` | `[]` | no |
| <a name="input_role"></a> [role](#input\_role) | GitHub team members role (member or maintainer) | `string` | `"member"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_members"></a> [members](#output\_members) | GitHub team members |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## License

**[MIT License](../../LICENSE)**

Copyright (c) 2022 **[Flaconi GmbH](https://github.com/flaconi)**

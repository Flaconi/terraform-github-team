# Terraform GitHub team module


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 4.19.1-fl.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 4.19.1-fl.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_team.team](https://registry.terraform.io/providers/flaconi/github/4.19.1-fl.3/docs/resources/team) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | GitHub team name | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | GitHub team description | `string` | `""` | no |
| <a name="input_privacy"></a> [privacy](#input\_privacy) | GitHub team privacy (closed / secret) | `string` | `"closed"` | no |
| <a name="input_parent_name"></a> [parent\_name](#input\_parent\_name) | The parent team name (must exist) | `string` | `null` | no |
| <a name="input_members"></a> [members](#input\_members) | GitHub team members | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | GitHub team name |
| <a name="output_id"></a> [id](#output\_id) | GitHub team id |
| <a name="output_slug"></a> [slug](#output\_slug) | GitHub team slug |
| <a name="output_parent"></a> [parent](#output\_parent) | GitHub parent team |
| <a name="output_privacy"></a> [privacy](#output\_privacy) | GitHub team privacy |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## License

**[MIT License](../../LICENSE)**

Copyright (c) 2022 **[Flaconi GmbH](https://github.com/flaconi)**

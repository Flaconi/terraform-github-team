# Ensure the 'ident' is used as the object key to ensure no re-creation by
# adding/removing/sorting teams in tfvars.
locals {
  teams = {
    for index, team in var.teams :
    # Cannot use defaults function with list because of issue in terraform
    # https://github.com/hashicorp/terraform/issues/28406
    # TODO: use defaults() function after issue is resolved
    team.ident => {
      name        = team.name
      description = team.description
      privacy     = team.privacy != null ? team.privacy : "closed"
      parent_name = team.parent_name
      members     = team.members != null ? team.members : tolist([])
    }
  }
}

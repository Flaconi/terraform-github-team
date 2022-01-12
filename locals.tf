# Ensure the 'ident' is used as the object key to ensure no re-creation by
# adding/removing/sorting teams in tfvars.
locals {
  teams = { for index, team in var.teams : team.ident => team }
}

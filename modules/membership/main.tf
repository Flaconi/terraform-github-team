# --------------------------------------------------------------------------------------------------
# Resources
# --------------------------------------------------------------------------------------------------
resource "github_team_membership" "membership" {
  for_each = {for user in var.members : user => user}

  team_id  = var.team_id
  username = each.key
  role     = var. role
}

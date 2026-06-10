# --------------------------------------------------------------------------------------------------
# Resources
# --------------------------------------------------------------------------------------------------
resource "github_team" "team" {
  name           = var.name
  description    = var.description
  privacy        = var.privacy
  parent_team_id = var.parent_name != null ? replace(lower(var.parent_name), "/[ .]/", "-") : null
}

# --------------------------------------------------------------------------------------------------
# Resources
# --------------------------------------------------------------------------------------------------
resource "github_team" "team" {
  name                      = var.name
  description               = var.description
  privacy                   = var.privacy
  create_default_maintainer = false
  parent_team_id            = var.parent_name != null ? replace(lower(var.parent_name), "/[ .]/", "-") : null
}

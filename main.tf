module "team" {
  for_each   = local.teams

  source = "./modules/team"

  name        = each.value.name
  description = each.value.description
  privacy     = each.value.privacy
  parent_name = each.value.parent_name
  members     = each.value.members
}

module "membership" {
  for_each   = { for name, team in module.team : name => {
    team_id = team.id
    members = local.teams[name].members
    role    = "member"
  } }

  source = "./modules/membership"

  team_id = each.value.team_id
  members = each.value.members
  role    = each.value.role

  depends_on = [module.team]
}

output "teams" {
  description = "GitHub teams."
  value = { for name, team in module.team : name => {
    id      = team.id
    name    = team.name
    node_id = team.node_id
    parent  = team.parent
    privacy = team.privacy
    slug    = team.slug
    members = [for username, member in module.membership[name].members : username]
  } }
}

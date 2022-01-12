output "name" {
  description = "GitHub team name"
  value       = github_team.team.name
}

output "id" {
  description = "GitHub team id"
  value       = github_team.team.id
}

output "slug" {
  description = "GitHub team slug"
  value       = github_team.team.slug
}

output "parent" {
  description = "GitHub parent team"
  value       = github_team.team.parent_team_id
}

output "privacy" {
  description = "GitHub team privacy"
  value       = github_team.team.privacy
}

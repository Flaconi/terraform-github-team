variable "token" {
  description = "Github token to be used for given organization to manage teams and their membership for."
  type        = string
}

variable "owner" {
  description = "Github organization name to manage teams and their membership for."
  type        = string
}

variable "teams" {
  description = "GitHub teams to manage."
  type = list(object({
    ident       = string       # Unique identifier for each item to guarantee no re-create during list change
    name        = string       # Name of the team as displayed on GitHub
    description = string       # Description of the team
    privacy     = string       # Privacy (closed or secret)
    parent_name = string       # Name of the Parent team (must also be defined)
    members     = list(string) # List of GitHub usernames to assign to a team
  }))
}

provider "github" {
  token = var.token
  owner = var.owner
}

module "teams" {
  source = "../"

  teams = var.teams
}

output "teams" {
  description = "GitHub teams."
  value       = module.teams.teams
}

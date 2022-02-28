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

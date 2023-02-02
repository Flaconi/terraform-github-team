variable "teams" {
  description = "GitHub teams to manage."
  type = list(object({
    ident       = string                     # Unique identifier for each item to guarantee no re-create during list change
    name        = string                     # Name of the team as displayed on GitHub
    description = optional(string)           # Description of the team
    privacy     = optional(string, "closed") # Privacy (closed or secret), default is closed
    parent_name = optional(string)           # Name of the Parent team
    members     = optional(list(string), []) # List of GitHub usernames to assign to a team
  }))
}

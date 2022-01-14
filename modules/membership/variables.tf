variable "team_id" {
  description = "GitHub team ID"
  type        = number
}

variable "members" {
  description = "GitHub team members (list of GitHub usernames)"
  type        = list(string)
  default     = []
}

variable "role" {
  description = "GitHub team members role (member or maintainer)"
  type        = string
  default     = "member"
}

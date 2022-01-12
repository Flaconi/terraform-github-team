variable "name" {
  description = "GitHub team name"
  type        = string
}

variable "description" {
  description = "GitHub team description"
  type        = string
  default     = ""
}

variable "privacy" {
  description = "GitHub team privacy (closed / secret)"
  type        = string
  default     = "closed"
}

variable "parent_name" {
  description = "The parent team name (must exist)"
  type        = string
  default     = null
}

variable "members" {
  description = "GitHub team members"
  type        = list(string)
  default     = []
}

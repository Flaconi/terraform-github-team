teams = [
  # ------------------------------------------------------------
  # DevOps
  # ------------------------------------------------------------
  {
    ident       = "0-devops"
    name        = "DevOps"
    description = "The DevOps Team"
    privacy     = "secret"
    members     = ["flaconi-devops"]
  },
  # ------------------------------------------------------------
  # Engineering
  # ------------------------------------------------------------
  {
    ident       = "0-engineering"
    name        = "Engineering"
    description = "The Engineering Team"
  },
  {
    ident       = "1-frontend"
    name        = "Frontend"
    description = "Team Frontend team"
    parent_name = "Engineering"
  },
  {
    ident       = "1-backend"
    name        = "Backend"
    description = "Team Backend team"
    parent_name = "Engineering"
  },
]

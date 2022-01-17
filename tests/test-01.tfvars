teams = [
  # ------------------------------------------------------------
  # DevOps
  # ------------------------------------------------------------
  {
    ident       = "0-devops"
    name        = "DevOps"
    description = "The DevOps Team"
    privacy     = "closed"
    parent_name = null
    members     = ["flaconi-devops"]
  },
  # ------------------------------------------------------------
  # Engineering
  # ------------------------------------------------------------
  {
    ident       = "0-engineering"
    name        = "Engineering"
    description = "The Engineering Team"
    privacy     = "closed"
    parent_name = null
    members     = []
  },
  {
    ident       = "1-frontend"
    name        = "Frontend"
    description = "Team Frontend team"
    privacy     = "closed"
    parent_name = "Engineering"
    members     = []
  },
  {
    ident       = "1-backend"
    name        = "Backend"
    description = "Team Backend team"
    privacy     = "closed"
    parent_name = "Engineering"
    members     = []
  },
]

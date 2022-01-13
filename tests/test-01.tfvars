teams = [
  # ------------------------------------------------------------
  # DevOps
  # ------------------------------------------------------------
  {
    ident       = "devops"
    name        = "DevOps"
    description = "The DevOps Team"
    privacy     = "closed"
    parent_name = null
    members     = ["cytopia"]
  },
  # ------------------------------------------------------------
  # Engineering
  # ------------------------------------------------------------
  {
    ident       = "engineering"
    name        = "Engineering"
    description = "The Engineering Team"
    privacy     = "closed"
    parent_name = null
    members     = []
  },
  {
    ident       = "frontend"
    name        = "Frontend"
    description = "Team Frontend team"
    privacy     = "closed"
    parent_name = "Engineering"
    members     = []
  },
  {
    ident       = "backend"
    name        = "Backend"
    description = "Team Backend team"
    privacy     = "closed"
    parent_name = "Engineering"
    members     = []
  },
]

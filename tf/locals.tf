## ---------------------------------------------------------------------------------------------------------------------
## Project Name                         - Project Name
## Project Description                  - Project Description
##
## Modification History:
##   - 1.0.0    Nov 22,2024 - Subhamay  - Initial Version
## ---------------------------------------------------------------------------------------------------------------------

#-- root/locals.tf --

locals {
  default-tags = {
    Environment      = var.environment-name
    ProjectName      = var.project-name
    GitHubRepository = var.github-repo
    GitHubRef        = var.github-ref
    GitHubURL        = var.github-url
    GitHubSHA        = var.github-sha
  }
}

locals {
  masked-account-id = join("-", ["xxxx", "xxxx", substr(data.aws_caller_identity.current.account_id, 8, 4)])
  account_id        = data.aws_caller_identity.current.account_id
}
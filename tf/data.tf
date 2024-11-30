## ---------------------------------------------------------------------------------------------------------------------
## Project Name                         - Project Name
## Project Description                  - Project Description
##
## Modification History:
##   - 1.0.0    Nov 22,2024 - Subhamay  - Initial Version
## ---------------------------------------------------------------------------------------------------------------------

#-- root/data.tf --

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}
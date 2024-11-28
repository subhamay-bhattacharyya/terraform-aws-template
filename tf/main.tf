## ---------------------------------------------------------------------------------------------------------------------
## Project Name                         - Project Name
## Project Description                  - Project Description
##
## Modification History:
##   - 1.0.0    Nov 22,2024 - Subhamay  - Initial Version
## ---------------------------------------------------------------------------------------------------------------------

#-- root/main.tf --

module "s3" {
  source             = "./modules/s3"
  aws-region         = var.aws-region
  project-name       = var.project-name
  environment-name   = var.environment-name
  bucket-base-name   = var.bucket-base-name
  versioning-enabled = var.versioning-enabled
  sse-algorithm      = var.sse-algorithm
  kms-master-key-id  = var.kms-master-key-id
  s3-lifecycle-rules = var.s3-lifecycle-rules
  bucket-policy-json = var.bucket-policy-json
  ci-build           = var.ci-build
  s3-tags            = var.s3-tags
}
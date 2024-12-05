## ---------------------------------------------------------------------------------------------------------------------
## Project Name                         - Project Name
## Project Description                  - Project Description
##
## Modification History:
##   - 1.0.0    Nov 22,2024 - Subhamay  - Initial Version
## ---------------------------------------------------------------------------------------------------------------------

#-- root/outputs.tf --

output "resources" {
  value = {
    aws-environment    = var.environment-name
    aws-region         = data.aws_region.current.name
    aws-account-id     = local.masked-account-id
    bucket-arn         = module.s3.bucket_arn
    bucket-id          = module.s3.bucket_id
    bucket-region      = module.s3.bucket_region
    bucket-domain-name = module.s3.bucket_domain_name
    bucket-tags        = module.s3.bucket_tags
  }
}

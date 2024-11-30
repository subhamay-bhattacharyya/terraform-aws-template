## ---------------------------------------------------------------------------------------------------------------------
## Project Name                         - Project Name
## Project Description                  - Project Description
##
## Modification History:
##   - 1.0.0    Nov 22,2024 - Subhamay  - Initial Version
## ---------------------------------------------------------------------------------------------------------------------

#-- root/devl.terrform.tfvars --

aws-region         = "us-east-1"
project-name       = "tf-template"
bucket-base-name   = "sample-bucket"
versioning-enabled = false
kms-master-key-id  = "arn:aws:kms:us-east-1:637423502513:key/494509e4-3bc5-44b8-9c4d-12449900d395"
sse-algorithm      = "aws:kms"
s3-lifecycle-rules = {
  rule1 = {
    prefix          = "logs/"
    tags            = { "rule" : "log", "autoclean" : "true" }
    enabled         = true
    expiration_days = 365
    transition = [
      {
        days          = 30
        storage_class = "STANDARD_IA"
      },
      {
        days          = 90
        storage_class = "ONEZONE_IA"
      },
      {
        days          = 270
        storage_class = "DEEP_ARCHIVE"
      }
    ]
  }
}
bucket-policy-json = null
s3-tags = {
  "key1" = "value1"
  "key2" = "value2"
}
## ---------------------------------------------------------------------------------------------------------------------
## Project Name                         - Project Name
## Project Description                  - Project Description
##
## Modification History:
##   - 1.0.0    Nov 22,2024 - Subhamay  - Initial Version
## ---------------------------------------------------------------------------------------------------------------------

#-- root/prod.terrform.tfvars --

aws-region         = "us-east-1"
project-name       = "tf-template"
bucket-base-name   = "sample-bucket"
versioning-enabled = true
kms-master-key-id  = "arn:aws:kms:us-east-1:590183790608:key/e9b903b9-534a-4766-9774-5d10b5146d56"
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
        days          = 60
        storage_class = "ONEZONE_IA"
      },
      {
        days          = 180
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
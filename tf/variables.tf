## ---------------------------------------------------------------------------------------------------------------------
## Project Name                         - Project Name
## Project Description                  - Project Description
##
## Modification History:
##   - 1.0.0    Nov 22,2024 - Subhamay  - Initial Version
## ---------------------------------------------------------------------------------------------------------------------

#-- root/variables.tf --

######################################## AWS Configuration #########################################
variable "aws-region" {
  type    = string
  default = "us-east-1"
}

######################################## Project Name ##############################################
variable "project-name" {
  description = "The name of the project"
  type        = string
  default     = ""
}

######################################## Environment Name ##########################################
variable "environment-name" {
  type        = string
  description = <<EOT
  (Optional) The environment in which to deploy our resources to.

  Options:
  - devl : Development
  - test: Test
  - prod: Production

  Default: devl
  EOT
  default     = "devl"

  validation {
    condition     = can(regex("^devl$|^test$|^prod$", var.environment-name))
    error_message = "Err: environment is not valid."
  }
}

######################################## Bucket Configuration ######################################
# The base name of the S3 bucke
variable "bucket-base-name" {
  description = "The base name of the S3 bucket"
  type        = string
  default     = "sample-bucket"
}

# Whether versioning is enabled for the S3 bucke
variable "versioning-enabled" {
  description = "Whether versioning is enabled for the S3 bucket"
  type        = bool
  default     = false
}

# The KMS master key ID used for the SSE-KMS encryption
variable "kms-master-key-id" {
  description = "The AWS KMS master key ID used for the SSE-KMS encryption"
  type        = string
  default     = null
}

# The algorithm used for server-side encryption (AES256 or aws:kms or aws:kms:dsse)
variable "sse-algorithm" {
  description = <<EOT
  The server-side encryption algorithm to use (AES256 or aws:kms)

  Options:
  - AES256 : AWS S3 managed keys
  - aws:kms: SSE-KMS
  - aws:kms:dsse: AWS KMS managed

  Default: devl
  EOT
  default     = "AES256"

  validation {
    condition     = can(regex("^AES256$|^aws:kms$|^aws:kms:dsse$", var.sse-algorithm))
    error_message = "Err: environment is not valid."
  }
  type = string
}

# A map variable for the S3 lifecycle rules
variable "s3-lifecycle-rules" {
  type = map(object({
    prefix          = string
    tags            = map(string)
    enabled         = bool
    expiration_days = number
    transition = list(object({
      days          = number
      storage_class = string
    }))
  }))
  default = {
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
    },
    rule2 = {
      prefix          = "logs2/"
      tags            = { "rule" : "log2", "autoclean" : "true" }
      enabled         = true
      expiration_days = 365
      transition = [
        {
          days          = 30
          storage_class = "STANDARD_IA"
        },
        {
          days          = 75
          storage_class = "INTELLIGENT_TIERING"
        },
        {
          days          = 90
          storage_class = "GLACIER_IR"
        },
        {
          days          = 180
          storage_class = "DEEP_ARCHIVE"
        }
      ]
    }
  }
}

# Bucket policy configuration
variable "bucket-policy-json" {
  description = "The JSON string for the bucket policy"
  type        = string
  default     = null
}

# Default tags for the S3 bucket
variable "tags" {
  description = "A map of tags to assign to the bucket"
  type = object({
    Environment      = string
    ProjectName      = string
    GitHubRepository = string
    GitHubRef        = string
    GitHubURL        = string
    GitHubSHA        = string
  })
  default = {
    Environment      = "devl"
    ProjectName      = "terraform-s3-bucket-example"
    GitHubRepository = "test-repo"
    GitHubRef        = "refs/heads/main"
    GitHubURL        = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    GitHubSHA        = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  }
}

# S3 bucket tags
variable "s3-tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
  default     = null
}
######################################## GitHub ####################################################
# The CI build string
variable "ci-build" {
  description = "The CI build string"
  type        = string
  default     = ""
}

# The GitHub repository name
variable "github-repo" {
  description = "The GitHub repository name"
  type        = string
  default     = "repo"
}

# GitHub branch or tag
variable "github-ref" {
  description = "GitHub branch or tag"
  type        = string
  default     = "refs/heads/main"
}

# GitHub repository URL
variable "github-url" {
  description = "GitHub repository URL"
  type        = string
  default     = "https://git-url"
}

# GitHub commit SHA
variable "github-sha" {
  description = "GitHub commit SHA"
  type        = string
  default     = "abcdef"
}
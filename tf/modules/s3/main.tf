/*
####################################################################################################
# Terraform S3 Bucket Configuration
#
# Description: This module creates an S3 bucket with versioning, encryption, lifecycle rules,
#              and bucket policy using Terraform.
#
# Author: Subhamay Bhattacharyya
# Created: 11-Nov-2024  Updated: 12-Nov-2024  9:44
# Version: 1.0
#
####################################################################################################
*/

# --- S3 Bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket        = local.s3-bucket-name
  force_destroy = false

  tags = var.s3-tags == null ? {} : var.s3-tags
}

# ---  Bucket Versioning
resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = var.versioning-enabled ? "Enabled" : "Suspended"
  }
}

# ---  Bucket Server-Side Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_sse_configuration" {
  # count  = var.sse-algorithm != null ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.sse-algorithm == "aws:kms" ? var.kms-master-key-id : null
      sse_algorithm     = var.sse-algorithm # AES256 , "aws:kms"
    }
    bucket_key_enabled = true
  }
}

# ---  Bucket Lifecycle Configuration
resource "aws_s3_bucket_lifecycle_configuration" "s3_bucket_lifecycle_configuration" {
  count  = var.s3-lifecycle-rules != null ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id

  dynamic "rule" {
    for_each = var.s3-lifecycle-rules
    content {
      id = rule.key
      filter {
        and {
          prefix = rule.value.prefix
          tags   = rule.value.tags
        }
      }
      status = rule.value.enabled ? "Enabled" : "Disabled"

      dynamic "transition" {
        for_each = rule.value.transition
        content {
          days          = transition.value.days
          storage_class = transition.value.storage_class
        }

      }

      expiration {
        days = rule.value.expiration_days
      }
    }
  }
}

# Bucket Policy
resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  count  = var.bucket-policy-json != null ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id
  policy = var.bucket-policy-json
}

/*
###################################################################################################
# Terraform Outputs Configuration
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

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.id
}

output "bucket_region" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.region
}

output "bucket_domain_name" {
  description = "The domain name of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.bucket_domain_name
}

output "bucket_tags" {
  description = "The tags of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.tags_all
}
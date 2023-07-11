### S3 Bucket - Region - 1
#---------------------------------------------------------------------------------------------------
output "pisces_s3_bucket_region_1_region" {
  description = "Region of the S3 bucket (region-1)"
  value       = module.s3-bucket-region-1.region
}
output "pisces_s3_bucket_region_1_arn" {
  description = "Arn of the S3 bucket in region-1"
  value       = module.s3-bucket-region-1.arn
}
output "pisces_s3_bucket_region_1_id" {
  description = "Id of the S3 bucket in region-1"
  value       = module.s3-bucket-region-1.id
}
output "pisces_s3_bucket_region_1_domain_name" {
  description = "Domain name of the S3 bucket in region-1"
  value       = module.s3-bucket-region-1.domain_name
}
### S3 Bucket - Region - 2
#---------------------------------------------------------------------------------------------------
output "pisces_s3_bucket_region_2_region" {
  description = "Region of the S3 bucket (region-2)"
  value       = module.s3-bucket-region-2.region
}
output "pisces_s3_bucket_region_2_arn" {
  description = "Arn of the S3 bucket in region-2"
  value       = module.s3-bucket-region-2.arn
}
output "pisces_s3_bucket_region_2_id" {
  description = "Id of the S3 bucket in region-2"
  value       = module.s3-bucket-region-2.id
}
output "pisces_s3_bucket_region_2_domain_name" {
  description = "Domain name of the S3 bucket in region-2"
  value       = module.s3-bucket-region-2.domain_name
}
### S3 Bucket - Region - 3
#---------------------------------------------------------------------------------------------------
output "pisces_s3_bucket_region_3_region" {
  description = "Region of the S3 bucket (region-3)"
  value       = module.s3-bucket-region-3.region
}
output "pisces_s3_bucket_region_3_arn" {
  description = "Arn of the S3 bucket in region-3"
  value       = module.s3-bucket-region-3.arn
}
output "pisces_s3_bucket_region_3_id" {
  description = "Id of the S3 bucket in region-3"
  value       = module.s3-bucket-region-3.id
}
output "pisces_s3_bucket_region_3_domain_name" {
  description = "Domain name of the S3 bucket in region-3"
  value       = module.s3-bucket-region-3.domain_name
}
### S3 Bucket CRR Policy
#---------------------------------------------------------------------------------------------------
output "pisces_s3_crr_role_arn" {
  description = "Arn of the S3 CRR Role"
  value       = aws_iam_policy.pisces_s3_bucket_crr_iam_policy.arn
}
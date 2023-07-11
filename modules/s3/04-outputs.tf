output "region" {
  description = "Region name of the S3 bucket"
  value       = aws_s3_bucket.pisces_s3_bucket.region
}

output "arn" {
  description = "Arn of the S3 bucket"
  value       = aws_s3_bucket.pisces_s3_bucket.arn
}

output "id" {
  description = "Id of the S3 bucket"
  value       = aws_s3_bucket.pisces_s3_bucket.id
}

output "domain_name" {
  description = "Domain name of the S3 bucket"
  value       = aws_s3_bucket.pisces_s3_bucket.bucket_domain_name
}

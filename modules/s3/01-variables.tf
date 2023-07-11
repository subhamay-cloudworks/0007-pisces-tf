######################################## Project Name ##############################################
variable "project_name" {}
######################################## Environment Name ##########################################
variable "environment_name" {}
######################################## KMS Key ###################################################
variable "kms_key_alias" {}
######################################## Regions ###################################################
variable "regions" {
  description = "Regions where the buckets will be created"
  type        = map(string)
}
######################################## S3 Bucket #################################################
variable "s3_bucket_base_name" {}
######################################## Source Account Id #########################################
variable "source_account_id" {
  description = "The AWS Acount Id of the source account"
  type        = string
}
######################################## Destination Account Id ####################################
variable "destination_account_id" {
  description = "The AWS Acount Id for the target S3 bucket"
  type        = string
}
######################################## IAM Role ##################################################
variable "crr_iam_role_name" {
  description = "CRR Role name"
  type        = string
}
variable "crr_iam_policy_name" {
  description = "CRR Policy name"
  type        = string
}
######################################## Local Variables ###########################################
locals {
  tags = tomap({
    Environment = var.environment_name
    ProjectName = var.project_name
  })
}

locals {
  s3_bucket_name = "${var.project_name}-${var.s3_bucket_base_name}-${data.aws_caller_identity.current.account_id}-${var.environment_name}-${data.aws_region.current.name}"
}
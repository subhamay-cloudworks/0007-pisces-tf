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
######################################## Project Name ##############################################
variable "project_name" {
  description = "The name of the project"
  type        = string
}

######################################## Environment Name ##########################################
variable "environment_name" {
  description = "The name of the environment"
  type        = string
}

######################################## Regions ###################################################
variable "regions" {
  description = "Regions where the buckets will be created"
  type        = map(string)
}
######################################## S3 Bucket #################################################
variable "s3_bucket_base_name" {
  description = "S3 bucket base name"
  type        = string
}
######################################## KMS Key ###################################################
variable "kms_key_alias" {
  description = "KMS Key Id"
  type        = string
}

variable "kms_key_arn" {
  description = "KMS Key Arn by Region"
  type        = map(string)
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


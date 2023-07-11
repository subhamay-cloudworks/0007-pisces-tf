######################################## AWS Account Id ############################################
variable "source_account_id" {
  description = "The AWS Acount Id for the source AWS account"
  type        = string
}

######################################## IAM Assume Role ###########################################
variable "account_access_role_name" {
  description = "The IAM role to be used to access the target AWS account"
  type        = string
  default     = "iam-role"
}
######################################## Project Name ##############################################
variable "project_name" {}
######################################## Environment Name ##########################################
variable "environment_name" {}
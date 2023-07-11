# # main.tf
# module "us-east-1" {
#   source = "./modules/s3"
#   name   = "my-queue-name"
#   providers = {
#     aws = aws
#   }
# }
# module "us-east-2" {
#   source = "./modules/s3"
#   name   = "my-queue-name"
#   providers = {
#     aws = aws.us-east-2
#   }
# }


# main.tf
module "s3-bucket-region-1" {
  source                 = "./modules/s3"
  project_name           = var.project_name
  environment_name       = var.environment_name
  s3_bucket_base_name    = var.s3_bucket_base_name
  kms_key_alias          = var.kms_key_alias
  source_account_id      = var.source_account_id
  destination_account_id = var.destination_account_id
  regions                = var.regions
  crr_iam_role_name      = var.crr_iam_role_name
  crr_iam_policy_name    = var.crr_iam_policy_name
  providers = {
    aws = aws
  }
}

module "s3-bucket-region-2" {
  source                 = "./modules/s3"
  project_name           = var.project_name
  environment_name       = var.environment_name
  s3_bucket_base_name    = var.s3_bucket_base_name
  kms_key_alias          = var.kms_key_alias
  source_account_id      = var.source_account_id
  destination_account_id = var.destination_account_id
  regions                = var.regions
  crr_iam_role_name      = var.crr_iam_role_name
  crr_iam_policy_name    = var.crr_iam_policy_name
  providers = {
    aws = aws.region-2
  }
}

module "s3-bucket-region-3" {
  source                 = "./modules/s3"
  project_name           = var.project_name
  environment_name       = var.environment_name
  s3_bucket_base_name    = var.s3_bucket_base_name
  kms_key_alias          = var.kms_key_alias
  source_account_id      = var.source_account_id
  destination_account_id = var.destination_account_id
  regions                = var.regions
  crr_iam_role_name      = var.crr_iam_role_name
  crr_iam_policy_name    = var.crr_iam_policy_name
  providers = {
    aws = aws.region-3
  }
}
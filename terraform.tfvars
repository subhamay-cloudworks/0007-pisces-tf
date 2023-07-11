source_account_id      = "807724355529"
destination_account_id = "508634243190"
project_name           = "pisces"
environment_name       = "devl"
s3_bucket_base_name    = "bucket"
kms_key_alias          = "alias/SB-KMS"
crr_iam_role_name      = "pisces-s3-crr-role"
crr_iam_policy_name    = "pisces-s3-crr-policy"
regions = {
  region-1 = "us-east-1"
  region-2 = "us-east-2"
  region-3 = "us-west-1"
}

kms_key_arn = {
  region-1 = "arn:aws:kms:us-east-1:807724355529:key/e4c733c5-9fbe-4a90-bda1-6f0362bc9b89"
  region-2 = "arn:aws:kms:us-east-2:807724355529:key/dfc9fe4a-7021-4eb8-a8e9-520a2f91f4f2"
  region-3 = "arn:aws:kms:us-west-1:508634243190:key/5d89bab8-d143-44ea-856d-9dac297fec67"
}
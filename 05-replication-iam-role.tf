### Cross Region Replication Assume Role
resource "aws_iam_role" "pisces_s3_bucket_crr_iam_role" {

  name               = var.crr_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.pisces_crr_assume_role.json
}
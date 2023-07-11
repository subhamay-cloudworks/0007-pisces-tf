### IAM Policy 
resource "aws_iam_policy" "pisces_s3_bucket_crr_iam_policy" {
  name   = var.crr_iam_policy_name
  policy = data.aws_iam_policy_document.pisces_crr_policy_document.json
}


### IAM Policy Atatchment
resource "aws_iam_role_policy_attachment" "pisces_s3_bucket_crr_iam_policy_attachment" {
  role       = aws_iam_role.pisces_s3_bucket_crr_iam_role.name
  policy_arn = aws_iam_policy.pisces_s3_bucket_crr_iam_policy.arn
}

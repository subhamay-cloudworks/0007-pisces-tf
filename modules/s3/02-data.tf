data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

# data "aws_iam_policy_document" "pisces_cross_account_s3_access_role" {
#   statement {
#     sid = "AllowCrossAccountAccess"
#     principals {
#       type        = "AWS"
#       identifiers = ["${var.source_account_id}"]
#     }
#     actions = [
#       "s3:ReplicateObject",
#       "s3:ReplicateDelete",
#       "s3:ReplicateTags",
#       "s3:ObjectOwnerOverrideToBucketOwner"
#     ]
#     resources = [
#       "arn:aws:s3:::*/*"
#     ]
#   }
# }


data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    sid = "Set replication permissions for objects"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.source_account_id}:role/${var.crr_iam_role_name}"]
    }

    actions = [
      "s3:ReplicateObject",
      "s3:ReplicateDelete"
    ]

    resources = ["arn:aws:s3:::${var.project_name}-${var.s3_bucket_base_name}-${var.destination_account_id}-${var.environment_name}-${var.regions.region-3}/*"]
  }

  statement {
    sid = "Set Bucket versioning permissions for objects"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.source_account_id}:role/${var.crr_iam_role_name}"]
    }

    actions = [
      "s3:List*",
      "s3:GetBucketVersioning",
      "s3:PutBucketVersioning"
    ]

    resources = ["arn:aws:s3:::${var.project_name}-${var.s3_bucket_base_name}-${var.destination_account_id}-${var.environment_name}-${var.regions.region-3}"]
  }
}
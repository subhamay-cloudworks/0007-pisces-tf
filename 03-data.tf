data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

### Cross Region Replication Assume Role
data "aws_iam_policy_document" "pisces_crr_assume_role" {

  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

### Cross Region Replication Policy Document
data "aws_iam_policy_document" "pisces_crr_policy_document" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "s3:GetReplicationConfiguration",
      "s3:ListBucket",
    ]
    resources = [module.s3-bucket-region-1.arn]
    sid       = "AllowReadS3SourceBucketConfiguration"
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetObjectVersionForReplication",
      "s3:GetObjectVersionAcl",
      "s3:GetObjectVersionTagging",
      "s3:GetObjectRetention",
      "s3:GetObjectLegalHold"
    ]
    resources = ["${module.s3-bucket-region-1.arn}/*"]
    sid       = "AllowGetS3SourceBucketObjectVersion"
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:ReplicateObject",
      "s3:ReplicateDelete",
      "s3:ReplicateTags",
      "s3:ObjectOwnerOverrideToBucketOwner"
    ]
    sid       = "AllowS3ObjectReplication"
    resources = ["${module.s3-bucket-region-2.arn}/*", "${module.s3-bucket-region-3.arn}/*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "kms:Decrypt"
    ]
    sid       = "AllowSourceBucketKMSDecryption"
    resources = ["${var.kms_key_arn.region-1}"]
    condition {
      test     = "StringLike"
      variable = "kms:ViaService"
      values   = ["s3.${var.regions.region-1}.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "kms:EncryptionContext:aws:s3:arn"
      values   = ["${module.s3-bucket-region-1.arn}"]
    }
  }

  statement {
    effect = "Allow"
    actions = [
      "kms:Encrypt"
    ]
    sid       = "AllowDestination1BucketKMSEncryption"
    resources = ["${var.kms_key_arn.region-2}"]
    condition {
      test     = "StringLike"
      variable = "kms:ViaService"
      values   = ["s3.${var.regions.region-2}.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "kms:EncryptionContext:aws:s3:arn"
      values   = ["${module.s3-bucket-region-2.arn}"]
    }
  }

  statement {
    effect = "Allow"
    actions = [
      "kms:Encrypt"
    ]
    sid       = "AllowDestination2BucketKMSEncryption"
    resources = ["${var.kms_key_arn.region-3}"]
    condition {
      test     = "StringLike"
      variable = "kms:ViaService"
      values   = ["s3.${var.regions.region-3}.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "kms:EncryptionContext:aws:s3:arn"
      values   = ["${module.s3-bucket-region-3.arn}"]
    }
  }

}

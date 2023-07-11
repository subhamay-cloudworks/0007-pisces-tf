# Define Local Values
locals {
  target_s3_regions = ["region-2", "region-3"]
}

### Cross Region Replication 
#---------------------------------------------------------------------------------------------------
resource "aws_s3_bucket_replication_configuration" "pisces_s3_bucket_crr" {

  # Must have bucket versioning enabled first
  depends_on = [module.s3-bucket-region-1, module.s3-bucket-region-2, module.s3-bucket-region-3]

  role   = aws_iam_role.pisces_s3_bucket_crr_iam_role.arn
  bucket = module.s3-bucket-region-1.id


  dynamic "rule" {
    for_each = toset(local.target_s3_regions)
    content {
      id       = "rule-${index(local.target_s3_regions, rule.value) + 1}"
      priority = index(local.target_s3_regions, rule.value)
      status   = "Enabled"

      filter {}
      source_selection_criteria {
        replica_modifications {
          status = "Enabled"
        }
        sse_kms_encrypted_objects {
          status = "Enabled"
        }
      }

      destination {
        bucket = (rule.value == "region-2") ? module.s3-bucket-region-2.arn : module.s3-bucket-region-3.arn

        storage_class = (rule.value == "region-2") ? "ONEZONE_IA" : "GLACIER_IR"
        dynamic "access_control_translation" {
          for_each = (rule.value == "region-3") ? [true] : []
          content {
            owner = "Destination"
          }
        }
        account = (rule.value == "region-3") ? var.destination_account_id : null

        encryption_configuration {
          replica_kms_key_id = var.kms_key_arn["${rule.value}"]
        }
      }

      delete_marker_replication {
        status = "Enabled"
      }
    }
  }
}

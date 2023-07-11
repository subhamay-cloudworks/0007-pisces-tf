# Local variable
locals {
  tags = tomap({
    Environment = var.environment_name
    ProjectName = var.project_name
  })
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    sid     = "AllowAssumeRole"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.source_account_id}:root"]
    }
  }
}

resource "aws_iam_role" "account_access_role" {
  name               = var.account_access_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge({ CreatedByModule = "account-access-iam-role" }, local.tags)
}

### IAM Policy Atatchment
resource "aws_iam_role_policy_attachment" "account_access_role_policy_attachment" {
  role       = aws_iam_role.account_access_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
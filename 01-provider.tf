# _provider.tf
terraform {
  backend "s3" {
    bucket  = "subhamay-tf-remote-state-us-east-1"            // Bucket where to SAVE Terraform State
    key     = "0007-pisces/devl/s3-buckets/terraform.tfstate" // Object name in the bucket to SAVE Terraform State
    region  = "us-east-1"                                     // Region where bucket created
    encrypt = true
    # shared_config_files      = ["/Users/subhamaybhattacharyya/.aws/config"]
    # shared_credentials_files = ["/Users/subhamaybhattacharyya/.aws/credentials"]
    profile = "Account-A"

    # For state locking
    # dynamodb_table = "pisces-tf-state-lock"
    # encrypt        = true
    # profile        = "Account-A"
  }
}


provider "aws" {
  region                   = "us-east-1" ##"${var.regions.region-1}"
  shared_config_files      = ["/Users/subhamaybhattacharyya/.aws/config"]
  shared_credentials_files = ["/Users/subhamaybhattacharyya/.aws/credentials"]
  profile                  = "Account-A"
}

provider "aws" {
  alias                    = "region-2"
  region                   = "us-east-2" ###"${var.regions.region-2}"
  shared_config_files      = ["/Users/subhamaybhattacharyya/.aws/config"]
  shared_credentials_files = ["/Users/subhamaybhattacharyya/.aws/credentials"]
  profile                  = "Account-A"
}

provider "aws" {
  alias                    = "region-3"
  region                   = "us-west-1" ###"${var.regions.region-3}"
  shared_config_files      = ["/Users/subhamaybhattacharyya/.aws/config"]
  shared_credentials_files = ["/Users/subhamaybhattacharyya/.aws/credentials"]
  profile                  = "Account-A"
  assume_role {
    role_arn = "arn:aws:iam::${var.destination_account_id}:role/terraform-account-access-role" ## Account-B

  }
}
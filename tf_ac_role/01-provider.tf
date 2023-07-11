terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  shared_config_files      = ["/Users/subhamaybhattacharyya/.aws/config"]
  shared_credentials_files = ["/Users/subhamaybhattacharyya/.aws/credentials"]
  profile                  = "Account-B"
}

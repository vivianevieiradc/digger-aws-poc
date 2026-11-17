terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region            = "us-east-1"
  s3_use_path_style = true

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3 = "https://127.0.0.1:9297"
  }

  custom_ca_bundle = pathexpand("~/.aws/emulator/9297/ca.pem")
}

resource "aws_s3_bucket" "poc" {
  bucket = "digger-aws-poc-lab"

  tags = {
    Environment = "poc"
    ManagedBy   = "terraform"
  }
}

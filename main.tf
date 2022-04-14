provider "vault" {
}

data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  role    = "tfc-role"
}

provider "aws" {
  region = "us-east-1"
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}

resource "aws_s3_bucket" "b" {
  bucket = "Prakash-1234567890-my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

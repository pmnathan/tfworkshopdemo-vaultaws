provider "vault" {
}

data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  role    = "fifththirdmain"
}

provider "aws" {
  region = "us-east-1"
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}

resource "aws_s3_bucket" "a" {
  bucket = "com-hashicorp-prakash-demo-2022"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

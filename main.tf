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

/**
resource "aws_vpc" "hashi" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "tfc-test-vpc"
  }
}
**/

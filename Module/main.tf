provider "aws" {
  region = "us-east-1"
  profile = "CodeweaverLabs"
}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
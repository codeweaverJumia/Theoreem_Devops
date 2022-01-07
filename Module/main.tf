#Setting up Terraform Remote state
 provider "aws" {
  region = "us-east-1"
  profile = "CodeweaverLabs"
}

terraform {
  backend "s3" {
    encrypt = true    
    bucket = "theorem-tf-state-bucket"
    dynamodb_table = "theorem-tf-state-lock-dynamo"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
} 
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
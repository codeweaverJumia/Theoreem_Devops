#Setting up Terraform Remote state;
terraform {
  backend "s3" {
    encrypt = true    
    bucket = "theorem-tf-state-bucket"
    dynamodb_table = "theorem-tf-state-lock-dynamo"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
} 
 
 provider "aws" {
  region = "us-east-1"
}

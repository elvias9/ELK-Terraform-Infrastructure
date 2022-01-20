terraform {
  backend "s3" {
    bucket         = "team-1-elk-stack"
    key            = "development/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}
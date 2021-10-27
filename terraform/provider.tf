provider "aws" {
    region = var.AWS_REGION
    shared_credentials_file = "/Users/ASUS/.aws/credentials"
    profile                 = "terraform-user"
}
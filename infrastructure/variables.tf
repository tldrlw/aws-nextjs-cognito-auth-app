variable "APP_NAME" {
  type    = string
  default = "aws-nextjs-cognito-auth-app"
}

variable "REGION" {
  type    = string
  default = "us-east-1"
}

variable "LAMBDA_PATH" {
  type    = string
  default = "lambda"
}

# Terraform auto loads tfvars files only when they are named terraform.tfvars or terraform.tfvars.json.
# https://spacelift.io/blog/terraform-tfvars
variable "TF_VAR_TEST_USER_1_PASSWORD" {
  type = string
}

variable "TF_VAR_TEST_USER_2_PASSWORD" {
  type = string
}

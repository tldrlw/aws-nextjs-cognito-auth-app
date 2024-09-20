variable "APP_NAME" {
  type    = string
  default = "aws-nextjs-cognito-auth-app"
}

variable "REGION" {
  type    = string
  default = "us-east-1"
}

# variable "LAMBDA_PATH" {
#   type    = string
#   default = "lambda"
# }

variable "IMAGE_TAG" {
  type = string
}

# Terraform auto loads tfvars files only when they are named terraform.tfvars or terraform.tfvars.json.
# https://spacelift.io/blog/terraform-tfvars
variable "TF_VAR_TEST_USER_1_PASSWORD" {
  type = string
}

variable "TF_VAR_TEST_USER_2_PASSWORD" {
  type = string
}

variable "VPC_ID" {
  type        = string
  default     = "vpc-0e1f2f49524f055a6"
  description = "managed in https://github.com/tldrlw/blog-tldrlw/blob/main/infrastructure/vpc.tf"
}

variable "HOSTNAME_SUBDOMAIN" {
  type    = string
  default = "cognito-test"
}
# https://blog.hubspot.com/marketing/parts-url

variable "HOSTNAME" {
  type    = string
  default = "cognito-test.tldrlw.com"
}

variable "ECS_CLUSTER_NAME" {
  type    = string
  default = "main"
}

variable "ROUTE_53_HOSTED_ZONE" {
  type    = string
  default = "tldrlw.com"
}

data "aws_vpc" "main" {
  id = var.VPC_ID
}

data "aws_subnets" "main_public" {
  filter {
    name   = "vpc-id"
    values = [var.VPC_ID]
  }
}

data "aws_route53_zone" "tldrlw_com" {
  name         = var.ROUTE_53_HOSTED_ZONE
  private_zone = false
}

data "aws_ecs_cluster" "main" {
  cluster_name = var.ECS_CLUSTER_NAME
}

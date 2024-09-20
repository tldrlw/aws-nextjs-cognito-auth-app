module "ecs_service" {
  source                      = "git::https://github.com/tldrlw/terraform-modules.git//ecs-service"
  app_name                    = var.APP_NAME
  ecr_repo_url                = aws_ecr_repository.main.repository_url
  image_tag                   = var.IMAGE_TAG
  ecs_cluster_id              = data.aws_ecs_cluster.main.id
  task_count                  = 2
  alb_target_group_arn        = module.main.alb_target_group_arn
  source_security_group_id    = module.main.alb_security_group_id
  security_group_egress_cidrs = ["0.0.0.0/0"]
  subnets                     = data.aws_subnets.main_public.ids
  vpc_id                      = data.aws_vpc.main.id
  container_port              = 3000
  host_port                   = 3000
  linux_arm64                 = true
  environment_variables = [
    {
      name  = "COGNITO_USER_POOL_ID"
      value = aws_cognito_user_pool.main.id
    },
    {
      name  = "COGNITO_USER_POOL_CLIENT_ID"
      value = aws_cognito_user_pool_client.main.id
    },
    {
      name  = "NEXT_PUBLIC_COGNITO_USER_POOL_ID"
      value = aws_cognito_user_pool.main.id
    },
    {
      name  = "NEXT_PUBLIC_COGNITO_USER_POOL_CLIENT_ID"
      value = aws_cognito_user_pool_client.main.id
    }
  ]
}

# ^ set `linux_arm64` to true if building and pushing images to ECR on M-series Macs:
# rm -rf .terraform/modules > terraform init
# run ^ after pushing up changes to modules when testing locally

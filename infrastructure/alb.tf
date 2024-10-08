module "main" {
  source               = "git::https://github.com/tldrlw/terraform-modules.git//app-load-balancer"
  vpc_id               = data.aws_vpc.main.id
  subnet_ids           = data.aws_subnets.main_public.ids
  alb_name             = var.APP_NAME
  hostname             = var.HOSTNAME
  target_group_name    = var.APP_NAME
  certificate_arn      = aws_acm_certificate_validation.main.certificate_arn
  security_group_cidrs = ["0.0.0.0/0"]
  enable_logs_to_s3    = true
  elb_account_id       = "127311923021"
}

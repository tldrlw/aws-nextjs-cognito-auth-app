resource "aws_cognito_user_pool" "main" {
  name = var.APP_NAME
  password_policy {
    minimum_length    = 12
    require_numbers   = true
    require_uppercase = true
  }
}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool

resource "aws_cognito_user_pool_client" "main" {
  name                                 = var.APP_NAME
  user_pool_id                         = aws_cognito_user_pool.main.id
  allowed_oauth_flows_user_pool_client = true
  generate_secret                      = false
  allowed_oauth_scopes                 = ["aws.cognito.signin.user.admin", "email", "openid", "profile"]
  allowed_oauth_flows                  = ["implicit", "code"]
  explicit_auth_flows                  = ["ADMIN_NO_SRP_AUTH", "USER_PASSWORD_AUTH"]
  # explicit_auth_flows                  = ["ALLOW_USER_SRP_AUTH", "ALLOW_REFRESH_TOKEN_AUTH", "USER_PASSWORD_AUTH"]
  # ^ might need to revisit these auth flow selections when token refresh comes into the picture...
  supported_identity_providers = ["COGNITO"]
  callback_urls                = ["https://example.com"]
  logout_urls                  = ["https://example.com"]
}

resource "aws_cognito_user_group" "admins" {
  name         = "Admins"
  user_pool_id = aws_cognito_user_pool.main.id
  # description  = "Managed by Terraform"
  # precedence   = 42
  # role_arn     = aws_iam_role.group_role.arn
  # ^ these 3 are optional
}

resource "aws_cognito_user" "test_user_1" {
  user_pool_id = aws_cognito_user_pool.main.id
  username     = "test-user-1"
  password     = var.TF_VAR_TEST_USER_1_PASSWORD
}

resource "aws_cognito_user_in_group" "test_user_1_admins" {
  user_pool_id = aws_cognito_user_pool.main.id
  group_name   = aws_cognito_user_group.admins.name
  username     = aws_cognito_user.test_user_1.username
}

resource "aws_cognito_user" "test_user_2" {
  user_pool_id = aws_cognito_user_pool.main.id
  username     = "test-user-2"
  password     = var.TF_VAR_TEST_USER_2_PASSWORD
}

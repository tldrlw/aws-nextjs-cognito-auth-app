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

resource "aws_cognito_user" "refayat_haque" {
  user_pool_id = aws_cognito_user_pool.main.id
  username     = "refayat-haque"
  password     = "2iJevHaRKzp0UwIq"
}

resource "aws_cognito_user" "abid_mansur" {
  user_pool_id = aws_cognito_user_pool.main.id
  username     = "abid-mansur"
  password     = "v3JoWuCGHlU79Vf0"
}

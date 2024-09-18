output "cognito-user-pool-id" {
  value = aws_cognito_user_pool.main.id
}

output "cognito-user-pool-endpoint" {
  value = aws_cognito_user_pool.main.endpoint
}

output "cognito-user-pool-client-secret" {
  value     = aws_cognito_user_pool_client.main.client_secret
  sensitive = true
}

output "cognito-user-pool-client-id" {
  value = aws_cognito_user_pool_client.main.id
}

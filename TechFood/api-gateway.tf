resource "aws_apigatewayv2_api" "http_api" {
  name          = "api-gateway-v1"
  protocol_type = "HTTP"

  depends_on = [
    aws_lambda_function.auth_lambda,
    aws_lambda_function.login_lambda
  ]
}

resource "aws_lambda_permission" "invoke_login" {
  statement_id  = "AllowInvokeByHttpApiLogin"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.login_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.http_api.execution_arn}/*/*"
  
}

resource "aws_lambda_permission" "invoke_auth" {
  statement_id  = "AllowInvokeByHttpApiAuth"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.auth_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.http_api.execution_arn}/*/*"
}


resource "aws_apigatewayv2_authorizer" "lambda_authorizer" {
  api_id                            = aws_apigatewayv2_api.http_api.id
  name                              = "auth-authorizer"
  authorizer_type                   = "REQUEST"
  authorizer_uri                    = aws_lambda_function.auth_lambda.invoke_arn
  identity_sources                  = ["$request.header.Authorization"]
  authorizer_payload_format_version = "2.0"
  enable_simple_responses           = true
  authorizer_result_ttl_in_seconds  = 300
}

resource "aws_apigatewayv2_integration" "login_integration" {
  api_id                 = aws_apigatewayv2_api.http_api.id
  integration_type       = "AWS_PROXY"
  integration_uri        = aws_lambda_function.login_lambda.invoke_arn
  payload_format_version = "2.0"
  integration_method     = "POST"
}


resource "aws_apigatewayv2_route" "login_post" {
  api_id             = aws_apigatewayv2_api.http_api.id
  route_key          = "POST /login"
  target             = "integrations/${aws_apigatewayv2_integration.login_integration.id}"
  authorization_type = "NONE"
}

resource "aws_apigatewayv2_route" "orders_any" {
  api_id             = aws_apigatewayv2_api.http_api.id
  route_key          = "ANY /orders"
  authorization_type = "CUSTOM"
  authorizer_id      = aws_apigatewayv2_authorizer.lambda_authorizer.id
}


resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.http_api.id
  name        = "$default"
  auto_deploy = true
}
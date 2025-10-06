resource "aws_lambda_function" "auth_func" {
  
  depends_on = [ 
    kubectl_manifest.deploy,
    aws_iam_role.lambda_exec_role
  ]
  
  function_name = "auth_func"
  role          = aws_iam_role.lambda_exec_role.arn
  runtime       = "python3.12"              
  handler       = "lambda_function.lambda_handler"
  timeout       = 15
  memory_size   = 256
  publish       = false                     
  filename         = "${path.module}/dummy.zip"
  source_code_hash = filebase64sha256("${path.module}/dummy.zip")

  layers = [var.jwt_layer_arn]

  environment {
    variables = {
      BACKEND_URL            = "http://${data.aws_lb.eks_nlb.dns_name}"
      JWT_ALGORITHM          = "HS256"
      JWT_EXPIRATION_MINUTES = "60"
    }
  }

}
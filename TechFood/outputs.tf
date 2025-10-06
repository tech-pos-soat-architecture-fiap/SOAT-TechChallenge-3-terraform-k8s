output "vpc_cidr" {
  value = aws_vpc.vpc_tech_food.cidr_block
}

output "vpc_id" {
  value = aws_vpc.vpc_tech_food.id
}

output "subnet_cidr" {
  value = aws_subnet.subnet_public[*].cidr_block
}

output "subnet_id" {
  value = aws_subnet.subnet_public[*].id
}

output "nlb_dns_name" {
  value       = data.aws_lb.eks_nlb.dns_name
  description = "DNS do NLB do EKS"
}

output "auth_func_arn" {
  value       = aws_lambda_function.auth_lambda.arn
  description = "ARN da função Lambda auth_func"
}

output "auth_func_name" {
  value       = aws_lambda_function.auth_lambda.function_name
  description = "Nome da função Lambda"
}
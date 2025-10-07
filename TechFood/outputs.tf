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

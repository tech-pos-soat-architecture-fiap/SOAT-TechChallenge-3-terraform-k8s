resource "aws_internet_gateway" "igw_tech_food" {
  vpc_id = aws_vpc.vpc_tech_food.id
}
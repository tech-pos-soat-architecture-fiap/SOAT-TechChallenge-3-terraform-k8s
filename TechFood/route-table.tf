resource "aws_route_table" "rt_public_tech_food" {
  vpc_id = aws_vpc.vpc_tech_food.id

  route {
    cidr_block = aws_vpc.vpc_tech_food.cidr_block
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_tech_food.id
  }
}

resource "aws_route_table_association" "rt_association-tech-food_0" {
  subnet_id      = aws_subnet.subnet_public[0].id
  route_table_id = aws_route_table.rt_public_tech_food.id
}

resource "aws_route_table_association" "rt_association-tech-food_1" {
  subnet_id      = aws_subnet.subnet_public[1].id
  route_table_id = aws_route_table.rt_public_tech_food.id
}

resource "aws_route_table_association" "rt_association-tech-food_2" {
  subnet_id      = aws_subnet.subnet_public[2].id
  route_table_id = aws_route_table.rt_public_tech_food.id
}
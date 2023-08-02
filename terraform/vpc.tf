resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "${terraform.workspace}-shroom"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${terraform.workspace}-shroom-gw"
  }
}

resource "aws_route_table" "shroom-route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${terraform.workspace}-shroom"
  }
}

resource "aws_route_table_association" "shroom" {
  subnet_id      = aws_subnet.main_public_1.id
  route_table_id = aws_route_table.shroom-route.id
}
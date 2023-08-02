resource "aws_subnet" "main_public_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${terraform.workspace}-shroom-public-1"
  }
}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.praneethdev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.praneethdev-igw.id
  }

  tags = {
    Name       = "praneethdev-vpc"
    managed_by = var.managed_by
  }
}

resource "aws_route_table" "private1" {
  vpc_id = aws_vpc.praneethdev-vpc.id

  tags = {
    Name       = "praneethdev-vpc"
    managed_by = var.managed_by
  }
}

resource "aws_route_table" "private2" {
  vpc_id = aws_vpc.praneethdev-vpc.id

  tags = {
    Name       = "praneethdev-vpc"
    managed_by = var.managed_by
  }
}

resource "aws_internet_gateway" "praneethdev-igw" {
  vpc_id = aws_vpc.praneethdev-vpc.id

  tags = {
    Name       = "praneethdev-vpc"
    managed_by = var.managed_by
  }
}

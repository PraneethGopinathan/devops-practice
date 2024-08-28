# Public Subnet - 1
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.praneethdev-vpc.id
  cidr_block              = "10.0.0.0/18"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-${var.region}a"
    # "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/elb" = 1
    managed_by               = var.managed_by
  }
}

# Public Subnet - 2
resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.praneethdev-vpc.id
  cidr_block              = "10.0.64.0/18"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-${var.region}b"
    # "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/elb" = 1
    managed_by               = var.managed_by

  }
}

# Private Subnet - 1
resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.praneethdev-vpc.id
  cidr_block        = "10.0.128.0/18"
  availability_zone = "${var.region}a"
  tags = {
    Name = "private-${var.region}a"
    # "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb" = 1
    managed_by                        = var.managed_by

  }
}

# Private Subnet - 2
resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.praneethdev-vpc.id
  cidr_block        = "10.0.192.0/18"
  availability_zone = "${var.region}b"
  tags = {
    Name = "private-${var.region}b"
    # "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb" = 1
    managed_by                        = var.managed_by

  }
}

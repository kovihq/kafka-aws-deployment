data "aws_region" "current_region" {}

resource "aws_subnet" "kad-public-subnet-a" {
  vpc_id                  = aws_vpc.kad-vpc.id
  availability_zone       = "${data.aws_region.current_region.name}a"
  cidr_block              = cidrsubnet(aws_vpc.kad-vpc.cidr_block, 4, 0)
  map_public_ip_on_launch = "true"

  tags = merge({ Name = "kad-public-subnet-a" }, var.tags)
}

resource "aws_subnet" "kad-public-subnet-b" {
  vpc_id                  = aws_vpc.kad-vpc.id
  availability_zone       = "${data.aws_region.current_region.name}b"
  cidr_block              = cidrsubnet(aws_vpc.kad-vpc.cidr_block, 4, 1)
  map_public_ip_on_launch = "true"

  tags = merge({ Name = "kad-public-subnet-b" }, var.tags)
}

resource "aws_subnet" "kad-public-subnet-c" {
  vpc_id                  = aws_vpc.kad-vpc.id
  availability_zone       = "${data.aws_region.current_region.name}c"
  cidr_block              = cidrsubnet(aws_vpc.kad-vpc.cidr_block, 4, 2)
  map_public_ip_on_launch = "true"

  tags = merge({ Name = "kad-public-subnet-c" }, var.tags)
}

resource "aws_subnet" "kad-private-subnet-a" {
  vpc_id                  = aws_vpc.kad-vpc.id
  availability_zone       = "${data.aws_region.current_region.name}a"
  cidr_block              = cidrsubnet(aws_vpc.kad-vpc.cidr_block, 4, 3)

  tags = merge({ Name = "kad-private-subnet-a" }, var.tags)
}

resource "aws_subnet" "kad-private-subnet-b" {
  vpc_id                  = aws_vpc.kad-vpc.id
  availability_zone       = "${data.aws_region.current_region.name}b"
  cidr_block              = cidrsubnet(aws_vpc.kad-vpc.cidr_block, 4, 4)

  tags = merge({ Name = "kad-private-subnet-b" }, var.tags)
}

resource "aws_subnet" "kad-private-subnet-c" {
  vpc_id                  = aws_vpc.kad-vpc.id
  availability_zone       = "${data.aws_region.current_region.name}c"
  cidr_block              = cidrsubnet(aws_vpc.kad-vpc.cidr_block, 4, 5)

  tags = merge({ Name = "kad-private-subnet-c" }, var.tags)
}

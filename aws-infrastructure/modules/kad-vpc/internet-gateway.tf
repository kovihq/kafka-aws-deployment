resource "aws_internet_gateway" "kad-internet-gateway" {
  vpc_id = aws_vpc.kad-vpc.id

  tags = merge({ Name = "kad-internet-gateway" }, var.tags)
}

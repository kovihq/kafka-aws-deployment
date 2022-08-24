resource "aws_eip" "ngw" {
  vpc = true
  tags = merge({ Name = "kad-ngw-eip" }, var.tags)
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.ngw.id
  subnet_id     = aws_subnet.kad-public-subnet-a.id

  depends_on = [aws_internet_gateway.kad-internet-gateway]

  tags = merge({ Name = "kad-nat-gateway" }, var.tags)
}

resource "aws_route" "default_route" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.kad-private-route-table.id
  nat_gateway_id         = aws_nat_gateway.this.id
}

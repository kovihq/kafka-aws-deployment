data "aws_vpc_peering_connection" "pcx_prod" {
  filter {
    name   = "tag:Name"
    values = ["iot-to-kafka"]
  }
}

resource "aws_route_table" "kad-public-route-table" {
  vpc_id = aws_vpc.kad-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kad-internet-gateway.id
  }

  route {
    cidr_block                = data.aws_vpc_peering_connection.pcx_prod.cidr_block
    vpc_peering_connection_id = data.aws_vpc_peering_connection.pcx_prod.id
  }

  tags = merge({ Name = "kad-public-route-table" }, var.tags)
}

resource "aws_route_table" "kad-private-route-table" {
  vpc_id = aws_vpc.kad-vpc.id

  tags = merge({ Name = "kad-private-route-table" }, var.tags)
}

resource "aws_route_table_association" "kad-public-route-table-public-subnet-a" {
  subnet_id      = aws_subnet.kad-public-subnet-a.id
  route_table_id = aws_route_table.kad-public-route-table.id
}

resource "aws_route_table_association" "kad-public-route-table-public-subnet-b" {
  subnet_id      = aws_subnet.kad-public-subnet-b.id
  route_table_id = aws_route_table.kad-public-route-table.id
}

resource "aws_route_table_association" "kad-public-route-table-public-subnet-c" {
  subnet_id      = aws_subnet.kad-public-subnet-c.id
  route_table_id = aws_route_table.kad-public-route-table.id
}

resource "aws_route_table_association" "kad-public-route-table-private-subnet-a" {
  subnet_id      = aws_subnet.kad-private-subnet-a.id
  route_table_id = aws_route_table.kad-private-route-table.id
}

resource "aws_route_table_association" "kad-private-route-table-private-subnet-b" {
  subnet_id      = aws_subnet.kad-private-subnet-b.id
  route_table_id = aws_route_table.kad-private-route-table.id
}

resource "aws_route_table_association" "kad-private-route-table-private-subnet-c" {
  subnet_id      = aws_subnet.kad-private-subnet-c.id
  route_table_id = aws_route_table.kad-private-route-table.id
}

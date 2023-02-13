############# Deploy AWS Subnets ##########

resource "aws_subnet" "subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block 
  availability_zone = var.availability_zones 
  tags              = merge(
    var.extra_tags,
    {
      Name = var.name 
    }
  )
}

############  Deploy Route Tables ###########

resource "aws_route_table" "route-table-public" {
  count = var.public_subnet ? 1 : 0
  vpc_id = var.vpc_id
  tags   = merge(
    var.extra_tags,
    {
      Name = var.name 
    }
  )

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id              = var.internetgw_id != "" ? var.internetgw_id : null
#    nat_gateway_id          = var.natgw_id != "" ? var.natgw_id : null
  }
}

############# AWS Route Table Association ########

#######  Purblic Subnet Association #######

resource "aws_route_table_association" "route-table-public-association" {
  count = var.public_subnet ? 1 : 0
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route-table-public[count.index].id
}

resource "aws_route_table" "route-table-private" {
  count = var.public_subnet ? 0 : 1
  vpc_id = var.vpc_id
  tags   = merge(
    var.extra_tags,
    {
      Name = var.name 
    }
  )

  route {
    cidr_block = "0.0.0.0/0"
#    gateway_id              = var.internetgw_id != "" ? var.internetgw_id : null
    nat_gateway_id          = var.natgw_id != "" ? var.natgw_id : null
  }
}
#######  Private Subnet Association #############


resource "aws_route_table_association" "route-table-private-association" {
  count = var.public_subnet ? 0 : 1
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route-table-private[count.index].id
}

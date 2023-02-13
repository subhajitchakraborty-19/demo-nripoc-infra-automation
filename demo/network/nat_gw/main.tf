######### EIP for NATGW ############

resource "aws_eip" "natgw-eip" {
  vpc           = true
  tags          = merge(
          var.extra_tags,
          {
            Name = "${var.natgw_name}"
          }
        )
}


##### Deploy NatGW #############


resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.natgw-eip.id
  subnet_id     = var.subnet_id
  tags          = merge(
          var.extra_tags,
          {
            Name = "${var.natgw_name}"
          }
        )
}

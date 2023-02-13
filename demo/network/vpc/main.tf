#############   Deploy AWS VPC ###############
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc-cidr-block
  enable_dns_hostnames = true
  enable_dns_support = true
  tags                 = merge(
           var.extra_tags,
          {
            Name = var.vpc_name
          }
        )
}

############   Deploy AWS Internet Gateway ##########

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags   = merge(
          var.extra_tags,
          {
            Name = var.internetgw_name
          }
        )
}

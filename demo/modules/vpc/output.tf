output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}

output "internet_gw_id" {
  description = "The ID of the Internet GW"
  value       = aws_internet_gateway.igw.id
}

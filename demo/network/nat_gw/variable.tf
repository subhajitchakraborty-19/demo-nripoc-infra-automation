variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = ""
}

variable "extra_tags" {
  description = "Extra tags"
  type        = map
  default     = {}
}

variable "natgw_name" {
  description = "NAT Gateway Name"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "SUBNET ID"
  type        = string
}


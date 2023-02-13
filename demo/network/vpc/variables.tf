variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = ""
}

variable "internetgw_name" {
  description = "Internet Gateway Name"
  type        = string
  default     = ""
}

variable "vpc-cidr-block" {
  description = "CIDR block for VPC"
  type        = string
  default     = ""
}

variable "extra_tags" {
  description = "Extra tags"
  type        = map
  default     = {}
}

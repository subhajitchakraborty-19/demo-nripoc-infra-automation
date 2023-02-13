variable "vpc_id" {
  type = string
  default = ""
}

variable "name" {
  type = string
  default = ""
}

variable "cidr_block" {
  type = string
  default = ""
}

variable "extra_tags" {
  description = "Extra tags"
  type        = map
  default     = {}
}

variable "public_subnet" {
  type        = bool
  default     = false
}

variable "availability_zones" {
  type = string
  default = ""
}

variable "natgw_id" {
  description = "NAT Gateway ID"
  type        = string
  default     = ""
}

variable "internetgw_id" {
  description = "Internet Gateway ID"
  type        = string
  default     = ""
}

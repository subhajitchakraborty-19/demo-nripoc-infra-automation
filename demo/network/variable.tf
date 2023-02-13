variable "profile" {
  description = "AWS profile"
  type        = string
  default     = "default"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "DEV-VPC-DEMO"
}

variable "vpc-cidr-block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "internetgw_name" {
  description = "Internet Gateway Name"
  type        = string
  default     = "DEV-IGW"
}

variable "extra_tags" {
  description = "Extra tags"
  type        = map(string)
  default     = {
   Environment = "DEV"
 }
}


variable "public-subnet" {
   type = map
   default = {
      sub-1 = {
         name = "public-subnet-1b"
         az = "ap-south-1b"
         cidr = "10.0.10.0/24"
      }
      sub-2 = {
         name = "public-subnet-1c"
         az = "ap-south-1c"
         cidr = "10.0.60.0/24"
      }
      sub-3 = {
         name = "public-subnet-1a"
         az = "ap-south-1a"
         cidr = "10.0.70.0/24"
      }
   }
}

variable "private-subnet" {
   type = map
   default = {
      sub-1 = {
         name = "private-subnet-nginx"
         az = "ap-south-1a"
         cidr = "10.0.30.0/24"
         gw = "nat-1"
      }
      sub-2 = {
         name = "private-subnet-app"
         az = "ap-south-1b"
         cidr = "10.0.40.0/24"
         gw = "nat-1"
      }
      sub-3 = {
         name = "private-subnet-db"
         az = "ap-south-1c"
         cidr = "10.0.50.0/24"
         gw = "nat-1"
      }
   }
}

variable "name_and_cidr_for_natgw" {
   type = map
   default = {
      nat-1 = {
         pub = "sub-1"
         name = "nat-gw-1b"
      }
      #nat-2 = {
      #   pub = "sub-2"
      #   name = "nat-gw-1c"
      #}
   }
}

variable "secret" {
   type = map
   default = {
      secret-1 = {
         name = "postgres-secret-1"
         username = "dbaadmin"
      }
      secret-2 = {
         name = "postgres-secret-2"
         username = "postadmin"
      }
   }
}


variable vpc_name {
    type = string
    description = "Name of the VPC"
    default = "MY_VPC"
}

variable "vpc_cidr_block" {
    type = string
    description = "CIDR Block of the VPC"
}

variable "avail_zones" {
    type = list(string)
    description = "List of the availabilty zones where the subnets will be deployed"
}

variable "private_subnet_cidrs" {
    type = list(string)
    description = "List of the CIDRs for the private subnet"
}

variable "public_subnet_cidrs" {
    type = list(string)
    description = "List of the CIDRs for the public subnet"
}

variable "database_subnet_cidrs" {
    type = list(string)
    description = "List of the CIDRs for the database subnet"
}

variable "enable_internet_gateway" {
    type = bool
    description = "If internet gateway should be created"
    default = false
}

variable "enable_NAT_gateway" {
    type = bool
    description = "If NAT Gateway should be enabled in all the public subnets"
    default = false
}

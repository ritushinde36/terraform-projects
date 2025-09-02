variable "security_group_name" {
    type = string
    description = "The name of the security group"
    default = "Example_SG"
}

variable "security_group_description" {
    type = string
    description = "Description of the security group"
    default = "Example_SG"
}

variable "ingress_rules" {
    type = list(map(string))
    description = "List of ingress rules, defined in a map structure"
}

variable "egress_rules" {
    type = list(map(string))
    description = "List of egress rules, defined in a map structure"
}

variable "vpc_id" {
    type = string
    description = "Id of the vpc where you want your VPC to be created in. It will be defined in the default vpc if not specified"
    default = null
  
}
variable "ec2_instance_id" {
    type = string
    description = "ID of the EC2 instance to which the EIP will be attached to"
}

variable "elastic_ip_name" {
    type = string
    description = "Name of the elastic IP"
}
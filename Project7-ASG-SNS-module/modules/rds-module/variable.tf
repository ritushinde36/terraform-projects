variable "rds_name" {
    type = string
    description = "Name of the RDS DB"
    default = "example-rds"
}

variable "rds_username" {
    type = string
    description = "Useename of the RDS DB"
}

variable "rds_password" {
    type = string
    description = "password of the rds DB"
    sensitive = true
}

variable "rds_database_subnets" {
    type = list(string)
    description = "List of subnets ids where the RDS instance will be created"
}

variable "rds_security_group_id" {
    type = list(string)
    description = "ID is the security group to associate with the RDS"
}

variable "rds_engine" {
    type = string
    description = "value of the RDS engine"
}

variable "rds_engine_version" {
    type = string
    description = "Value of the engine version of the RDS DB"
}

variable "rds_instance_class" {
    type = string
    description = "The value of the RDS instance class"
}

variable "rds_allocated_storage" {
    type = number
    description = "storage in GB"
}

variable "rds_port" {
    type = number
    description = "The port on which the db accepts connection"
}

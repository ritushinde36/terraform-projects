//Create Security group for bastion host
module "bastion_security_group" {
  source                     = "./modules/sg-module"
  security_group_name        = var.bastion_security_group_name
  security_group_description = var.bastion_security_group_description
  vpc_id                     = module.vpc.vpc_id
  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
  ]
  egress_rules = [
    {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"

    }
  ]

}

module "ec2_security_group" {
  source                     = "./modules/sg-module"
  security_group_name        = var.ec2_security_group_name
  security_group_description = var.ec2_security_group_description
  vpc_id                     = module.vpc.vpc_id
  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      cidr_ipv4   = var.vpc_cidr_block
    },
    {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      cidr_ipv4   = var.vpc_cidr_block
    }
  ]
  egress_rules = [
    {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"

    }
  ]

}

//Application Load balancer security group
module "app_lb_sg" {
  source = "./modules/sg-module"
  security_group_name = var.app_lb_sg_name
  security_group_description = var.app_lb_sg_description
  vpc_id                     = module.vpc.vpc_id
  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
  ]
  egress_rules = [
    {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"

    }
  ]
}


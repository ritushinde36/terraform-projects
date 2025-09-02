//create a VPC
module "vpc" {
  source                  = "./modules/vpc-module"
  vpc_cidr_block          = var.vpc_cidr_block
  vpc_name                = var.vpc_name
  avail_zones             = var.avail_zones
  private_subnet_cidrs    = var.private_subnet_cidrs
  public_subnet_cidrs     = var.public_subnet_cidrs
  database_subnet_cidrs   = var.database_subnet_cidrs
  enable_internet_gateway = var.enable_internet_gateway
  enable_NAT_gateway      = var.enable_NAT_gateway
}

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
    },
    {
      from_port   = 81
      to_port     = 81
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

//EC2 bastion host
module "ec2_bastion" {
  source                  = "./modules/ec2-module"
  ec2_instance_type       = var.ec2_instance_type
  ec2_instance_name       = "ec2_bastion"
  ec2_security_group_ids  = [module.bastion_security_group.security_group_id]
  ec2_instance_ami        = "ami-0150ccaf51ab55a51"
  ec2_instance_subnet_ids = [module.vpc.public_subnets[1]]
  ec2_key_name            = "private_ec2_key"

}

//EC2 private host
module "ec2_private_home" {
  source                  = "./modules/ec2-module"
  ec2_instance_type       = var.ec2_instance_type
  ec2_instance_name       = "ec2_private_home"
  ec2_instance_count      = var.ec2_private_instance_count
  ec2_key_name            = "private_ec2_key"
  ec2_security_group_ids  = [module.ec2_security_group.security_group_id]
  ec2_instance_subnet_ids = module.vpc.private_subnets
  ec2_user_data           = file("${local.user_data_path}/home_user_data_script.sh")
  depends_on = [module.vpc]
}

module "ec2_private_login" {
  source                  = "./modules/ec2-module"
  ec2_instance_type       = var.ec2_instance_type
  ec2_instance_name       = "ec2_private_login"
  ec2_instance_count      = var.ec2_private_instance_count
  ec2_key_name            = "private_ec2_key"
  ec2_security_group_ids  = [module.ec2_security_group.security_group_id]
  ec2_instance_subnet_ids = module.vpc.private_subnets
  ec2_user_data           = file("${local.user_data_path}/login_user_data_script.sh")
  depends_on = [module.vpc]

}

module "tg_home" {
  source = "./modules/tg-module"
  app_lb_target_group_name = "${var.app_lb_target_group_name}-home"
  app_lb_port = var.app_lb_port
  app_lb_protocol = var.app_lb_protocol
  alb_vpc_id = module.vpc.vpc_id
  app_lb_tg_instance_ids = module.ec2_private_home.ec2_ids
  app_lb_tg_health_check_path = "/home.html"

}

module "tg_login" {
  source = "./modules/tg-module"
  app_lb_target_group_name = "${var.app_lb_target_group_name}-login"
  app_lb_port = var.app_lb_port
  app_lb_protocol = var.app_lb_protocol
  alb_vpc_id = module.vpc.vpc_id
  app_lb_tg_instance_ids = module.ec2_private_login.ec2_ids
  app_lb_tg_health_check_path = "/login.html"
}


//Elastic IP for the bastion host
module "eip_bastion" {
  source = "./modules/eip-module"
  ec2_instance_id = module.ec2_bastion.ec2_ids[0]
  elastic_ip_name = "Bastion Elastic IP"
  depends_on = [ module.vpc, module.ec2_bastion ]
}

resource "null_resource" "bastion_provisioner" {

  depends_on = [ module.ec2_bastion ]

  connection {
    type = "ssh"
    user = "ec2-user"
    password = ""
    host = module.eip_bastion.eip_public_ip
    private_key = file("./Private_Key/private_ec2_key.pem")
  }

  provisioner "file" {
    source = "./Private_Key/private_ec2_key.pem"
    destination = "/tmp/private_ec2_key.pem"
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo chmod 400 /tmp/private_ec2_key.pem"
     ]
  }

  provisioner "local-exec" {
    command = "echo VPC ID : ${module.vpc.vpc_id} >> vpc-creation-details.txt"
    working_dir = "resource-information/"
  }

}

//Application load balancer for private EC2 instance
module "application_load_balancer" {
  source = "./modules/alb-module"
  app_lb_name = var.app_lb_name
  is_alb_internal = var.is_alb_internal
  app_lb_sg_ids = [module.app_lb_sg.security_group_id]
  app_lb_subnet_ids = module.vpc.public_subnets
  app_lb_port = var.app_lb_port
  app_lb_protocol = var.app_lb_protocol
}

module "listener_home" {
  source = "./modules/alb-listener-module"
  app_lb_target_group_arn = module.tg_home.tg_arn
  app_lb_arn = module.application_load_balancer.app_lb_arn
  app_lb_port = "80"
  app_lb_protocol = var.app_lb_protocol
}

module "listener_login" {
  source = "./modules/alb-listener-module"
  app_lb_target_group_arn = module.tg_login.tg_arn
  app_lb_arn = module.application_load_balancer.app_lb_arn
  app_lb_port = "81"
  app_lb_protocol = var.app_lb_protocol
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
    },
    {
      from_port   = 81
      to_port     = 81
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



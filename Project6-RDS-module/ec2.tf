//EC2 bastion host
module "ec2_bastion" {
  source                  = "./modules/ec2-module"
  ec2_instance_type       = var.ec2_instance_type
  ec2_instance_name       = "ec2_bastion"
  ec2_security_group_ids  = [module.bastion_security_group.security_group_id]
  ec2_instance_ami        = "ami-0150ccaf51ab55a51"
  ec2_instance_subnet_ids = [module.vpc.public_subnets[1]]
  ec2_key_name            = "private_ec2_key"
  ec2_user_data           = file("${local.user_data_path}/bastion_user_data_script.sh")

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

module "ec2_private_app" {
  source                  = "./modules/ec2-module"
  ec2_instance_type       = var.ec2_instance_type
  ec2_instance_name       = "ec2_private_app"
  ec2_instance_count      = var.ec2_private_instance_count
  ec2_key_name            = "private_ec2_key"
  ec2_security_group_ids  = [module.ec2_security_group.security_group_id]
  ec2_instance_subnet_ids = module.vpc.private_subnets
  ec2_user_data           = templatefile("${local.user_data_path}/app_user_data_template.tmpl",{rds_db_endpoint = module.rds.rds_address})
  depends_on = [module.vpc]
}

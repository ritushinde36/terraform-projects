//Elastic IP for the bastion host
module "eip_bastion" {
  source = "./modules/eip-module"
  ec2_instance_id = module.ec2_bastion.ec2_ids[0]
  elastic_ip_name = "Bastion Elastic IP"
  depends_on = [ module.vpc, module.ec2_bastion ]
}
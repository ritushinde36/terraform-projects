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
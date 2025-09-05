module "vpc" {
    source = "./modules/vpc-module"
    vpc_cidr_block = "10.0.0.0/16"
    vpc_name = "TF_VPC"

    avail_zones = ["us-east-1a","us-east-1b"]
    private_subnet_cidrs = ["10.0.1.0/24","10.0.2.0/24"]
    public_subnet_cidrs = ["10.0.3.0/24","10.0.4.0/24"]
    database_subnet_cidrs = ["10.0.5.0/24","10.0.6.0/24"]

    enable_internet_gateway = true
    enable_NAT_gateway = true
    
}
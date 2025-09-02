module "rds" {
    source = "./modules/rds-module"
    rds_name = var.rds_name
    rds_username = var.rds_username
    rds_password = var.rds_password
    rds_database_subnets = module.vpc.database_subnets
    rds_security_group_id = [module.rds_security_group.security_group_id]
    rds_engine = var.rds_engine
    rds_engine_version = var.rds_engine_version
    rds_instance_class = var.rds_instance_class
    rds_allocated_storage = var.rds_allocated_storage
    rds_port = var.rds_port

    depends_on = [ module.vpc ]
}
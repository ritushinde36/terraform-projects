module "lt_asg" {
    source = "./modules/asg-module"
    lt_name = var.lt_name
    lt_instance_type = var.lt_instance_type
    lt_vpc_security_group_ids = [module.ec2_security_group.security_group_id]
    lt_key_name = "private_ec2_key"
    lt_user_data = base64encode(file("${local.user_data_path}/home_user_data_script.sh"))
    lt_device_name = var.lt_device_name
    lt_detailed_monitoring = var.lt_detailed_monitoring

    asg_name = "${var.asg_name}-${random_integer.rand_int.id}"
    asg_desired_capacity = var.asg_desired_capacity
    asg_max_size = var.asg_max_size
    asg_min_size = var.asg_min_size
    asg_subnet_ids = module.vpc.private_subnets
    asg_tg_arn = module.tg_home.tg_arn 
    sns_topic_arn = module.sns.sns_topic_arn
    alb_arn_suffix = module.application_load_balancer.alb_arn_suffix
    tg_arn_suffix = module.tg_home.tg_arn_suffix
}
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

module "tg_app" {
  source = "./modules/tg-module"
  app_lb_target_group_name = "${var.app_lb_target_group_name}-app"
  app_lb_port = 8080
  app_lb_protocol = var.app_lb_protocol
  alb_vpc_id = module.vpc.vpc_id
  app_lb_tg_instance_ids = module.ec2_private_app.ec2_ids
  app_lb_tg_health_check_path = "/login"
}
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
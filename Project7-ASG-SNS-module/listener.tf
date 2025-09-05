module "listener_home" {
  source = "./modules/alb-listener-module"
  app_lb_target_group_arn = module.tg_home.tg_arn
  app_lb_arn = module.application_load_balancer.app_lb_arn
  app_lb_port = "80"
  app_lb_protocol = var.app_lb_protocol
}
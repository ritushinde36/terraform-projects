resource "aws_lb_listener" "app_lb_listener" {
    load_balancer_arn = var.app_lb_arn
    port = var.app_lb_port
    protocol = upper(var.app_lb_protocol)

    default_action {
      type = "forward"
       target_group_arn = var.app_lb_target_group_arn
    }
  
}
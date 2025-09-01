resource "aws_lb_target_group" "app_lb_tgs" {
    name = var.app_lb_target_group_name
    port = var.app_lb_port
    protocol = upper(var.app_lb_protocol)
    vpc_id = var.alb_vpc_id
}

resource "aws_lb_target_group_attachment" "app_lb_tg_atcmnt" {
for_each = {
  for index, id in var.app_lb_tg_instance_ids : index => id
}
  target_group_arn = aws_lb_target_group.app_lb_tgs.arn
  target_id = each.value
  port = var.app_lb_port
}

resource "aws_lb" "app_lb" {
    name = var.app_lb_name
    internal = var.is_alb_internal
    load_balancer_type = "application"
    security_groups  = var.app_lb_sg_ids
    subnets = var.app_lb_subnet_ids
}

resource "aws_lb_listener" "app_lb_listener" {
    load_balancer_arn = aws_lb.app_lb.arn
    port = var.app_lb_port
    protocol = upper(var.app_lb_protocol)

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.app_lb_tgs.arn
    }
  
}
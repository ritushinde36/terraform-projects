resource "aws_lb_target_group" "app_lb_tg" {
    name = var.app_lb_target_group_name
    port = var.app_lb_port
    protocol = upper(var.app_lb_protocol)
    vpc_id = var.alb_vpc_id
    health_check {
      path = var.app_lb_tg_health_check_path 
    }
}

resource "aws_lb_target_group_attachment" "app_lb_tg_atcmnt" {
for_each = {
  for index, id in var.app_lb_tg_instance_ids : index => id
}
  target_group_arn = aws_lb_target_group.app_lb_tg.arn
  target_id = each.value
  port = var.app_lb_port
}
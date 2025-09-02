resource "aws_elb" "classic_load_balancer" {
    name = var.classic_load_balancer_name
    availability_zones = var.classic_load_balancer_avail_zones

    dynamic "listener" {
        for_each = var.classic_load_balancer_listeners
        content {
            instance_port = listener.value["instance_port"]
            instance_protocol = listener.value["instance_protocol"]
            lb_port = listener.value["lb_port"]
            lb_protocol = listener.value["lb_protocol"]
        }

    }
    health_check {
        target              = var.classic_load_balancer_health_check.target
        interval            = var.classic_load_balancer_health_check.interval
        healthy_threshold   = var.classic_load_balancer_health_check.healthy_threshold
        unhealthy_threshold = var.classic_load_balancer_health_check.unhealthy_threshold
        timeout             = var.classic_load_balancer_health_check.timeout
    }
    instances = var.classic_load_balancer_instance_ids
    cross_zone_load_balancing   = var.classic_load_balancer_enable_cross_zone_load_balancing
    security_groups = var.classic_load_balancer_security_groups    
}



//Example of how to call this module

//security group for public facing classic load balancer
# module "classic_load_balancer_security_group" {
#   source                     = "./modules/sg-module"
#   security_group_name        = var.classic_load_balancer_security_group_name
#   security_group_description = var.classic_load_balancer_security_group_description
#   vpc_id                     = module.vpc.vpc_id
#   ingress_rules = [
#     {
#       from_port   = 80
#       to_port     = 80
#       ip_protocol = "tcp"
#       cidr_ipv4   = "0.0.0.0/0"
#     }
#   ]
#   egress_rules = [
#     {
#       ip_protocol = "-1"
#       cidr_ipv4   = "0.0.0.0/0"

#     }
#   ]
# }


//classic load balancer for private EC2
# module "classic_load_balancer" {
#   source = "./modules/clb-module"
#   classic_load_balancer_name = var.classic_load_balancer_name
#   classic_load_balancer_avail_zones =  var.avail_zones
#   classic_load_balancer_listeners = [
#     {
#       instance_port = 80
#       instance_protocol = "HTTP"
#       lb_port = 80
#       lb_protocol = "HTTP"
#     }
#     # {
#     #   instance_port = 80
#     #   instance_protocol = "HTTP"
#     #   lb_port = 81
#     #   lb_protocol = "HTTP"

#     # }
#   ]
#   classic_load_balancer_health_check = {
#     target              = "HTTP:80/"
#     interval            = 30
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 5

#   }
#   classic_load_balancer_instance_ids = module.ec2_private.ec2_ids
#   classic_load_balancer_enable_cross_zone_load_balancing = var.classic_load_balancer_enable_cross_zone_load_balancing
#   classic_load_balancer_security_groups = [module.classic_load_balancer_security_group.security_group_id]

# }
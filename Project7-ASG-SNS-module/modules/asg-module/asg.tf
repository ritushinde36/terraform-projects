//launch template
resource "aws_launch_template" "lt" {
    name = var.lt_name
    image_id  = var.lt_instance_ami == null ? data.aws_ami.instance_ami.id:var.lt_instance_ami
    instance_type = var.lt_instance_type
    vpc_security_group_ids = var.lt_vpc_security_group_ids
    key_name = var.lt_key_name 
    user_data = var.lt_user_data
    ebs_optimized = true
    update_default_version = true 
    block_device_mappings {
        device_name = var.lt_device_name
        ebs {
            volume_size = 20
            delete_on_termination = true
            volume_type = "gp2"
        }
    }
    monitoring {
      enabled = var.lt_detailed_monitoring
    }

    tag_specifications {
      resource_type = "instance"
      tags = {
        Name = var.lt_name
      }
    }
}

//autoscaling group
resource "aws_autoscaling_group" "asg" {
  name = var.asg_name
  desired_capacity = var.asg_desired_capacity
  max_size = var.asg_max_size
  min_size = var.asg_min_size
  vpc_zone_identifier = var.asg_subnet_ids
  health_check_type = "EC2"
  
  launch_template {
    id = aws_launch_template.lt.id
    version = aws_launch_template.lt.latest_version
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    triggers = ["desired_capacity"]
  }
}

resource "aws_autoscaling_attachment" "asg_tg_atchmt" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = var.asg_tg_arn
}

// auto scaling notification
resource "aws_autoscaling_notification" "asg_notifications" {
  group_names = [aws_autoscaling_group.asg.name]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = var.sns_topic_arn
}

//autoscaling policy
resource "aws_autoscaling_policy" "target_tracking_policy_average_cpu_util" {
  name                   = "target_tracking_policy_average_cpu_util"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  policy_type = "TargetTrackingScaling"
    target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
  }
}

resource "aws_autoscaling_policy" "target_tracking_policy_number_of_requests" {
  name                   = "target_tracking_policy_number_of_requests"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  policy_type = "TargetTrackingScaling"
    target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
      resource_label = "${var.alb_arn_suffix}/${var.tg_arn_suffix}"
    }
    target_value = 10.0
  }
}
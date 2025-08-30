resource "aws_security_group" "instance_security_group" {
  name        = "instance_security_group"
  description = "To allow ssh, http and https as inbound traffic from anywhere"
  tags = {
    name = "instance_security_group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress_security_group_rule_ssh" {
  security_group_id = resource.aws_security_group.instance_security_group.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "ingress_security_group_rule_http" {
  security_group_id = resource.aws_security_group.instance_security_group.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "ingress_security_group_rule_https" {
  security_group_id = resource.aws_security_group.instance_security_group.id
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "egress_security_group_rule_all" {
  security_group_id = resource.aws_security_group.instance_security_group.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}



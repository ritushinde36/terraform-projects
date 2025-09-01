resource "aws_security_group" "security_group"{
    name = var.security_group_name
    description = var.security_group_description
    vpc_id = var.vpc_id == null ? data.aws_vpc.default_vpc.id : var.vpc_id
    tags = {
        Name = var.security_group_name
    }
}

resource "aws_vpc_security_group_ingress_rule" "security_group_ingress_rules" {
    security_group_id = aws_security_group.security_group.id
    for_each = {for index, rule in var.ingress_rules: index => rule }

    from_port         = each.value["from_port"]
    to_port           = each.value["to_port"]
    ip_protocol       = each.value["ip_protocol"]
    cidr_ipv4         = each.value["cidr_ipv4"]

}

resource "aws_vpc_security_group_egress_rule" "security_group_egress_rules" {
  security_group_id = aws_security_group.security_group.id
  for_each = {for index, rule in var.egress_rules: index => rule }
    from_port         = lookup(each.value, "from_port", 0)
    to_port           = lookup(each.value, "to_port", 0)
    ip_protocol       = each.value["ip_protocol"]
    cidr_ipv4         = each.value["cidr_ipv4"]
}
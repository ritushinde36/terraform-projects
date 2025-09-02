output "security_group_id" {
    description = "ID of the security group created"
    value = aws_security_group.security_group.id
}
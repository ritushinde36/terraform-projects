output "vpc_id" {
    value = aws_vpc.vpc.id
    description = "ID of the VPC created"
}

output "public_subnets" {
    value = aws_subnet.vpc_subnets_public[*].id
    description = "List of the public subnets created"
}

output "private_subnets" {
    value = aws_subnet.vpc_subnets_private[*].id
    description = "List of the private subnets created"
}
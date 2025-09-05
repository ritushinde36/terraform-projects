resource "aws_eip" "eip_nat_gateway" {
    count = length(var.public_subnet_cidrs)
    tags = {
        Name = aws_subnet.vpc_subnets_public[count.index].tags["Name"]
    }
}
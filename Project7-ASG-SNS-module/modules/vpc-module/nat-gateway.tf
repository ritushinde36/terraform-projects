resource "aws_nat_gateway" "public_nat_gateway" {
    count = length(var.public_subnet_cidrs)
    allocation_id = aws_eip.eip_nat_gateway[count.index].id
    subnet_id = aws_subnet.vpc_subnets_public[count.index].id
    tags = {
        Name = "${aws_subnet.vpc_subnets_public[count.index].tags["Name"]}_NAT_GW"
    }

    depends_on = [ aws_internet_gateway.internet_gateway ]

}


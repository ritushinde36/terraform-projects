resource "aws_route_table" "public_aws_route_tables"{
    vpc_id = aws_vpc.vpc.id
    count = length(var.public_subnet_cidrs)

    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway[0].id
    }

    tags = {
        Name = "Public_RT_${aws_subnet.vpc_subnets_public[count.index].tags["Name"]}"
    }

}

resource "aws_route_table_association" "public_route_table_association" {
    count = length(var.public_subnet_cidrs)
    subnet_id = aws_subnet.vpc_subnets_public[count.index].id
    route_table_id = aws_route_table.public_aws_route_tables[count.index].id
}

resource "aws_route_table" "private_route_tables" {
    vpc_id = aws_vpc.vpc.id
    count = length(var.private_subnet_cidrs)

    route  {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.public_nat_gateway[count.index].id
    }

    tags = {
        Name = "Private_RT_${aws_subnet.vpc_subnets_private[count.index].tags["Name"]}"
    }
}

resource "aws_route_table_association" "private_route_table_association" {
    count = length(var.private_subnet_cidrs)
    subnet_id = aws_subnet.vpc_subnets_private[count.index].id
    route_table_id = aws_route_table.private_route_tables[count.index].id
}
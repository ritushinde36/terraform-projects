resource "aws_subnet" "vpc_subnets_private" {
    vpc_id = aws_vpc.vpc.id
    count = length(var.avail_zones)

    availability_zone = var.avail_zones[count.index]
    cidr_block = var.private_subnet_cidrs[count.index]

    tags = {
        Name = "private_${var.vpc_name}_${var.avail_zones[count.index]}"
        vpc_name = var.vpc_name
        type = "private"
    }
}

resource "aws_subnet" "vpc_subnets_public" {
    vpc_id = aws_vpc.vpc.id
    count = length(var.avail_zones)

    availability_zone = var.avail_zones[count.index]
    cidr_block = var.public_subnet_cidrs[count.index]

    tags = {
        Name = "public_${var.vpc_name}_${var.avail_zones[count.index]}"
        vpc_name = var.vpc_name
        type = "public"
    }
}

resource "aws_subnet" "vpc_subnets_database" {
    vpc_id = aws_vpc.vpc.id
    count = length(var.avail_zones)

    availability_zone = var.avail_zones[count.index]
    cidr_block = var.database_subnet_cidrs[count.index]

    tags = {
        Name = "database_${var.vpc_name}_${var.avail_zones[count.index]}"
        vpc_name = var.vpc_name
        type = "database"
    }
}
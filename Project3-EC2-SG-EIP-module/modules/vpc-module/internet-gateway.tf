resource "aws_internet_gateway" "internet_gateway" {
    count = var.enable_internet_gateway ? 1 :0
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "${var.vpc_name}_IG"
    }
}
resource "aws_eip" "elastic_ip" {
    instance = var.ec2_instance_id
    domain = "vpc"
    tags = {
        Name = var.elastic_ip_name
    }
}
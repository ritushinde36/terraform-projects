resource "aws_instance" "ec2_instance" {
    count = var.ec2_instance_count
    instance_type = var.ec2_instance_type
    ami = var.ec2_instance_ami == null ? data.aws_ami.instance_ami.id : var.ec2_instance_ami
    key_name = var.ec2_key_name
    security_groups = var.ec2_security_group_ids
    subnet_id = var.ec2_instance_subnet_ids[count.index]
    user_data = var.ec2_user_data
    tags = {
        Name = "${var.ec2_instance_name}_${count.index}"
    }
}



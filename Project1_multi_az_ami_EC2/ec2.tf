resource "aws_instance" "ec2_instance" {
  ami                    = data.aws_ami.instance_ami.id
  instance_type          = var.instanceType
  for_each = toset(local.az_list)
  availability_zone = each.value
  user_data              = file("${path.module}/user_data.sh")
  vpc_security_group_ids = [aws_security_group.instance_security_group.id]
  tags = {
    Name = "Instance_${each.value}"
  }

}
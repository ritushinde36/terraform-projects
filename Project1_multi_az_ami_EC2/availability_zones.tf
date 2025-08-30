data "aws_availability_zones" "avail_zones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

// get the list of availability zones that support the desired instance type
data "aws_ec2_instance_type_offerings" "avail_inst_types" {
  for_each = toset(data.aws_availability_zones.avail_zones.names)
  filter {
    name = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name = "location"
    values = [each.value]
  }

  location_type = "availability-zone"
}






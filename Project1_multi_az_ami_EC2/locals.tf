locals {
    az_list = keys({
    for az, item in data.aws_ec2_instance_type_offerings.avail_inst_types : 
    az => item.instance_types if length(item.instance_types) != 0
  })

}

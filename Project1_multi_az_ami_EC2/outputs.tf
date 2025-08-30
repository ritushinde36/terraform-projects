# output "instance_ids_splat" {
#     description = "Value of instance ids in a list"
#     value = aws_instance.ec2_instance[*].id
# }

# output "instance_ids" {
#     description = "Instance IDs created"
#     value = [for instance in aws_instance.ec2_instance : instance.id]
# }

# output "instance_names_for"{
#     description = "values of instance names using for loop"
#     value = [for instance in aws_instance.ec2_instance : instance.tags["Name"]]
# }

# output "instanceName_instanceId" {
#     value = {
#         for instance in aws_instance.ec2_instance : instance.tags["Name"] => instance.id
#     }
# }

# output "instanceCount_instancePublicDNS" {
#     value = {
#         for ct, instance in aws_instance.ec2_instance : ct => instance.public_dns
#     }
# }

output "instanceAz_instanceid" {
    value = {
        for az, instance in aws_instance.ec2_instance : az => instance.id 
    }
}
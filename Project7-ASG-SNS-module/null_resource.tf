resource "null_resource" "bastion_provisioner" {
  depends_on = [ module.ec2_bastion ]
  connection {
    type = "ssh"
    user = "ec2-user"
    password = ""
    host = module.eip_bastion.eip_public_ip
    private_key = file("./Private_Key/private_ec2_key.pem")
  }

  provisioner "file" {
    source = "./Private_Key/private_ec2_key.pem"
    destination = "/tmp/private_ec2_key.pem"
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo chmod 400 /tmp/private_ec2_key.pem"
     ]
  }

  provisioner "local-exec" {
    command = "echo VPC ID : ${module.vpc.vpc_id} >> vpc-creation-details.txt"
    working_dir = "resource-information/"
  }

}

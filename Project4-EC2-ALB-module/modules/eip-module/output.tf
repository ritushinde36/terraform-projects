output "eip_public_ip" {
    description = "Elastic IP attached to the EC2"
    value = aws_eip.elastic_ip.public_ip
  
}
resource "aws_db_instance" "rds_db" {
    db_name = var.rds_name
    username = var.rds_username
    password = var.rds_password
    db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.tags["Name"]
    vpc_security_group_ids = var.rds_security_group_id
    engine = var.rds_engine
    engine_version = var.rds_engine_version
    instance_class = var.rds_instance_class
    allocated_storage    = var.rds_allocated_storage
    port = var.rds_port
    skip_final_snapshot = true
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_subnet_group"
  subnet_ids = var.rds_database_subnets

  tags = {
    Name = "rds_subnet_group"
  }
}

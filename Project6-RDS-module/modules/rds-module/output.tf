output "rds_address" {
  value = aws_db_instance.rds_db.address
  description = "Hostname of RDS DB"
}
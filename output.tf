output "rds_subnet_group" {
  description = "RDS subnet group"
  value       = aws_db_subnet_group.general-db-subnet-group
}
output "db_instance" {
  description = "DB instance"
  value       = aws_db_instance.general-mysql-db
}
output "db_parameter_group" {
  description = "DB parameter group"
  value       = aws_db_parameter_group.general-parameter-group
}
output "rds_security_group" {
  description = "RDS security group"
  value       = aws_security_group.general-sg-rds
}
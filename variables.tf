variable "rds_engine" {
  description = "Database engine"
  default     = "mysql"
}
variable "rds_db_name" {
  description = "Database name"
  default     = "general_db_name"
}
variable "rds_version" {
  description = "Mysql version"
  default     = "8.0.33"
}
variable "rds_instance_class" {
  description = "RDS instance class"
  default     = "db.t3.micro"
}
variable "rds_allocated_storage" {
  description = "MySQL allocated storage"
  default     = 20
}
variable "rds_username" {
  description = "MySQL superadmin username"
  default     = "general_super_admin"
}
variable "rds_password" {
  description = "MySQL superadmin password"
  default     = "kavxur-Muvmy7-ravqet"
}
variable "region_name" {
  description = "Region name"
  type        = string
}
variable "private_subnet_1_id" {
  description = "Private subnet 1"
  type        = string
}
variable "private_subnet_2_id" {
  description = "Private subnet 2"
  type        = string
}
variable "vpc_security_group_ids" {
  description = "VPC security group ids"
}
variable "aws_vpc_id" {
    description = "VPC ID"
    type        = string
}
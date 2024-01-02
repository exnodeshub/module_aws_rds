# module_aws_vpc  
My module vpc aws

## Getting started  
config git credentical for private repo   
href: https://gitlab.com/exnodes-new/terraform-core/-/tree/master/modules/module_aws_rds?ref_type=heads

add module    
example:       
```JavaScript

module "example_rds" {
  source = "./modules/module_aws_rds"
  region_name = "your region name, Ex: tokyo"
  private_subnet_2_id = "your private subnet 2 id"
  private_subnet_1_id = "your private subnet 1 id"
  # allow sg
  vpc_security_group_ids = "your list of security groups id, Ex: [sg-id-1, sg-id-2, ...]"
  rds_db_name = "your database name"
}
```

# Input 
```JavaScript
variable "rds_engine" {
  description = "Database engine"
  default     = "mysql"
}
variable "rds_db_name" {
  description = "Database name"
  default     = "example_db_name"
}
variable "rds_version" {
  description = "Mysql version"
  default     = "5.7.0"
}
variable "rds_instance_class" {
  description = "RDS instance class"
  default     = "db.t3.large"
}
variable "rds_allocated_storage" {
  description = "MySQL allocated storage"
  default     = 50
}
variable "rds_username" {
  description = "MySQL superadmin username"
  default     = "example_user"
}
variable "rds_password" {
  description = "MySQL superadmin password"
  default     = "example-password"
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
}
```

# Output 
```JavaScript
output "rds_subnet_group" {
  description = "RDS subnet group"
  value       = aws_db_subnet_group.general-db-subnet-group
}
output "db_instance" {
  description = "DB instance"
  value       = aws_db_instance.general-mysql-db
}
output "db_parameter_group" {
  description = "DB instance"
  value       = aws_db_parameter_group.general-parameter-group
}
output "rds_security_group" {
  description = "RDS security group"
  value       = aws_security_group.general-sg-rds
}
```
# RDS Security Group (traffic ECS -> RDS)
resource "aws_security_group" "general-sg-rds" {
  name        = "${var.region_name}-general-rds-sg"
  vpc_id      = var.aws_vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = "3306"
    to_port         = "3306"
    security_groups = var.vpc_security_group_ids
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.region_name} RDS MySQL Security Group"
  }
}

################################################
# general RDS
################################################
resource "aws_db_subnet_group" "general-db-subnet-group" {
  name       = "${var.region_name}-db-subnet-group"
  subnet_ids = [var.private_subnet_1_id, var.private_subnet_2_id]
}

resource "aws_db_instance" "general-mysql-db" {
  identifier              = "${var.region_name}-twss-db"
  allocated_storage       = 10
  db_name                 = var.rds_db_name
  engine                  = var.rds_engine
  engine_version          = var.rds_version
  instance_class          = var.rds_instance_class
  username                = var.rds_username
  password                = var.rds_password
  skip_final_snapshot     = true
  backup_retention_period = 5
  vpc_security_group_ids  = [aws_security_group.general-sg-rds.id] # ec2-rds-sg which was created manually
  db_subnet_group_name    = aws_db_subnet_group.general-db-subnet-group.name
  # Set param group name
  parameter_group_name  = aws_db_parameter_group.general-parameter-group.name
}

resource "aws_db_parameter_group" "general-parameter-group" {
  name   = "general-custom-rds-param"
  family = "mysql8.0"
  description = "update log_bin_trust_function_creators for trigger, max_allowed_packet for full text search"
  # Params for create trigger
  parameter {
    name  = "log_bin_trust_function_creators"
    value = 1
  }
  # Params for full text search
  parameter {
    name  = "max_allowed_packet"
    value = 268435456
  }
}

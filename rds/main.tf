resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.db_subnet_ids
  tags = {
    Name = "RDS subnet group"
  }
}

resource "aws_db_instance" "mysql" {
  identifier              = "mydb-instance"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.db_instance_class
  name                    = var.db_name
  username                = var.db_username
  password                = var.db_password
  port                    = var.db_port
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = [var.db_sg_id]
  multi_az                = true
  publicly_accessible     = false
  skip_final_snapshot     = true

  tags = {
    Name = "MySQL-RDS"
  }
}

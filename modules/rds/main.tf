resource "aws_db_instance" "db" {
  identifier             = var.identifier_name
  allocated_storage      = var.allocated_storage
  max_allocated_storage  = 10
  db_name                = var.db_name
  engine                 = "postgres"
  engine_version         = "16.2"
  instance_class         = "db.t3.micro"
  username               = var.username
  password               = var.db_password
  parameter_group_name   = "default.postgres16"
  skip_final_snapshot    = true
  tags                   = var.tags_rds
  vpc_security_group_ids = var.vpc_security_group_ids
  #availability_zone = var.availability_zone
  db_subnet_group_name = var.subnet_group_name
  multi_az             = true
}


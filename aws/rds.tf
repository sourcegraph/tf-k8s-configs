## RDS instance creation option
resource "aws_db_instance" "sourcegraph" {
  count = var.create_rds ? 1 : 0

  engine         = "postgres"
  engine_version = "13.7"

  instance_class    = var.frontend_db_instance_class
  allocated_storage = var.frontend_db_allocated_storage

  db_name             = var.frontend_db_name
  username            = var.frontend_db_username
  password            = var.frontend_db_password
  publicly_accessible = true

  db_subnet_group_name   = aws_db_subnet_group.sourcegraph_dbs_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds.id]
}

resource "aws_db_instance" "codeintel" {
  count = var.create_rds ? 1 : 0

  engine         = "postgres"
  engine_version = "13.7"

  instance_class    = var.codeintel_db_instance_class
  allocated_storage = var.codeintel_db_allocated_storage

  db_name             = var.codeintel_db_name
  username            = var.codeintel_db_username
  password            = var.codeintel_db_password
  publicly_accessible = true

  db_subnet_group_name   = aws_db_subnet_group.sourcegraph_dbs_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds.id]
}

resource "aws_db_instance" "codeinsights" {
  count = var.create_rds ? 1 : 0

  engine         = "postgres"
  engine_version = "13.7"

  instance_class    = var.codeinsights_db_instance_class
  allocated_storage = var.codeinsights_db_allocated_storage

  db_name             = var.codeinsights_db_name
  username            = var.codeinsights_db_username
  password            = var.codeinsights_db_password
  publicly_accessible = true

  db_subnet_group_name   = aws_db_subnet_group.sourcegraph_dbs_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds.id]
}
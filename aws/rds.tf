## RDS instance creation option
resource "aws_db_instance" "sourcegraph" {
  count = var.create_rds ? 1 : 0

  engine         = "postgres"
  engine_version = "12.7"

  # Use large instance type
  instance_class = var.frontend_db_instance_class
  # Provision storage for all DBs
  allocated_storage = var.frontend_db_allocated_storage

  # Create frontend databases
  db_name  = var.frontend_db_name
  username = var.frontend_db_username
  password = var.frontend_db_password

  # Allow access from Sourcegraph
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.node_group_one.id]

}

resource "aws_db_instance" "codeintel" {
  count = var.create_rds ? 1 : 0

  engine         = "postgres"
  engine_version = "12.7"

  # Use large instance type
  instance_class = var.codeintel_db_instance_class
  # Provision storage for all DBs
  allocated_storage = var.codeintel_db_allocated_storage

  db_name  = var.codeintel_db_name
  username = var.codeintel_db_username
  password = var.codeintel_db_password

  # Allow access from Sourcegraph
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.node_group_one.id]
}

resource "aws_db_instance" "codeinsights" {
  count = var.create_rds ? 1 : 0

  engine         = "postgres"
  engine_version = "12.7"

  # Use large instance type
  instance_class = var.codeinsights_db_instance_class
  # Provision storage for all DBs
  allocated_storage = var.codeinsights_db_allocated_storage

  db_name  = var.codeinsights_db_name
  username = var.codeinsights_db_username
  password = var.codeinsights_db_password

  # Allow access from Sourcegraph
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.node_group_one.id]
}


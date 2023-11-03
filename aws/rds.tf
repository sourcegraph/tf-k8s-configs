## RDS instances created when `create_rds_dbs` is true
resource "aws_db_instance" "pgsql" {
  count = var.create_rds_dbs ? 1 : 0

  engine         = "postgres"
  engine_version = "13.7"

  identifier        = "pgsql"
  instance_class    = var.pgsql_db_instance_class
  allocated_storage = var.pgsql_db_allocated_storage

  db_name  = var.pgsql_db_name
  username = var.pgsql_db_username
  password = var.pgsql_db_password

  skip_final_snapshot       = true
  final_snapshot_identifier = var.pgsql_db_final_snapshot_identifier

  publicly_accessible    = true
  db_subnet_group_name   = aws_db_subnet_group.sourcegraph_dbs_subnet_group[0].name
  vpc_security_group_ids = [aws_security_group.rds[0].id]
}

resource "aws_db_instance" "codeintel" {
  count = var.create_rds_dbs ? 1 : 0

  engine         = "postgres"
  engine_version = "13.7"

  identifier        = "codeintel"
  instance_class    = var.codeintel_db_instance_class
  allocated_storage = var.codeintel_db_allocated_storage

  db_name  = var.codeintel_db_name
  username = var.codeintel_db_username
  password = var.codeintel_db_password

  skip_final_snapshot       = true
  final_snapshot_identifier = var.codeintel_db_final_snapshot_identifier

  publicly_accessible    = true
  db_subnet_group_name   = aws_db_subnet_group.sourcegraph_dbs_subnet_group[0].name
  vpc_security_group_ids = [aws_security_group.rds[0].id]
}

resource "aws_db_instance" "codeinsights" {
  count = var.create_rds_dbs ? 1 : 0

  engine         = "postgres"
  engine_version = "13.7"

  identifier        = "codeinsights"
  instance_class    = var.codeinsights_db_instance_class
  allocated_storage = var.codeinsights_db_allocated_storage

  db_name  = var.codeinsights_db_name
  username = var.codeinsights_db_username
  password = var.codeinsights_db_password

  skip_final_snapshot       = true
  final_snapshot_identifier = var.codeinsights_db_final_snapshot_identifier

  publicly_accessible    = true
  db_subnet_group_name   = aws_db_subnet_group.sourcegraph_dbs_subnet_group[0].name
  vpc_security_group_ids = [aws_security_group.rds[0].id]
}

## RDS instance created when `create_rds_single_db` is true

resource "aws_db_instance" "sourcegraph" {
  count = var.create_rds_single_db ? 1 : 0

  engine         = "postgres"
  engine_version = "13.7"

  identifier        = "sourcegraph"
  instance_class    = var.dbs_instance_class
  allocated_storage = var.dbs_allocated_storage

  db_name  = var.dbs_name
  username = var.dbs_username
  password = var.dbs_password

  skip_final_snapshot       = true
  final_snapshot_identifier = var.dbs_final_snapshot_identifier

  publicly_accessible    = true
  db_subnet_group_name   = aws_db_subnet_group.sourcegraph_dbs_subnet_group[0].name
  vpc_security_group_ids = [aws_security_group.rds[0].id]
}

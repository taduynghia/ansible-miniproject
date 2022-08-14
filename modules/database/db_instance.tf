resource "aws_db_subnet_group" "db-subnet" {
  name       = "db-subnet"
  subnet_ids = [data.aws_subnet.private-subnet[0].id, data.aws_subnet.private-subnet[1].id]
}

resource "aws_db_instance" "db" {
  identifier              = "db"
  allocated_storage       = var.storage
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  db_name                 = var.db_name
  skip_final_snapshot     = true
  publicly_accessible     = false
  username                = var.username
  password                = var.password
  db_subnet_group_name    = aws_db_subnet_group.db-subnet.name
  vpc_security_group_ids  = [data.aws_security_group.db-sg.id]
  backup_retention_period = 5
}

resource "aws_db_instance" "db-replica" {
  identifier             = "db-replica"
  replicate_source_db    = aws_db_instance.db.identifier
  skip_final_snapshot    = true
  publicly_accessible    = false
  apply_immediately      = true
  instance_class         = var.instance_class
  vpc_security_group_ids = [data.aws_security_group.db-sg.id]
}

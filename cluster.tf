resource "aws_rds_cluster" "default" {
	cluster_identifier = "${var.db_name}"
	engine = "${var.engine}"
	engine_version = "${var.engine_version}"
	db_subnet_group_name = "${aws_db_subnet_group.db.name}"
	database_name = "mydb"
	master_username = "${var.username}"
	master_password = "${var.password}"
	backup_retention_period = 5
	skip_final_snapshot = true
	preferred_backup_window = "07:00-09:00"
	vpc_security_group_ids = ["${aws_security_group.db.id}"]
}

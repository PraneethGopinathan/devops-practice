output "db_endpoint" {
  value       = aws_db_instance.rds_instance.endpoint
  description = "DB_Endpoint"
  sensitive   = false
}

output "db_engine" {
  value       = aws_db_instance.rds_instance.engine
  description = "DB_Engine"
  sensitive   = false
}

output "db_engine_version" {
  value       = aws_db_instance.rds_instance.engine_version
  description = "DB_Engine_Version"
  sensitive   = false
}

output "db_secret" {
  value       = aws_db_instance.rds_instance.master_user_secret
  description = "DB_master_secret_id"
  sensitive   = false
}


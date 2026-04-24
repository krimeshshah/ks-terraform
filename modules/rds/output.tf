output "fastapi_postgres_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.db.db_instance_endpoint
}

output "fastpi_db_resource_id" {
  value = module.db.db_instance_resource_id
}

output "fastapi_postgres_instance_address" {
  description = "The address of the RDS instance"
  value       = module.db.db_instance_address
}

output "fastapi_postgres_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = module.db.db_instance_master_user_secret_arn
}
# Global
project    = "praneeth-devops-test"
managed_by = "praneeth"
region     = "eu-west-1"

# S3
s3_bucket_name = "praneeth-devops-test-frontend-react-bucket"

# RDS
rds_allocated_storage = 20
rds_engine            = "postgres"
rds_engine_version    = "15.4"
rds_instance_class    = "db.t3.small"
rds_identifier        = "praneeth-test-1"
rds_db_name           = "backenddb"
rds_username          = "postgres"
rds_password          = "password"

# ECS
ecs_app_name        = "employee-backend"
ecs_container_image = "chathan/employee-project-backend:latest"
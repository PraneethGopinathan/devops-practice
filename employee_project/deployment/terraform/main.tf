# # S3
# module "s3" {
#   source     = "./s3"
#   name       = var.s3_bucket_name
#   managed_by = var.managed_by
#   project    = var.project
# }

# VPC
module "vpc" {
  source     = "./vpc"
  managed_by = var.managed_by
  project    = var.project
  region     = var.region
}

# ECS & LB
module "ecs-lb" {
  source             = "./ecs-lb"
  region             = var.region
  vpc_id             = module.vpc.vpc_id
  public_1_subnet_id = module.vpc.public_1_subnet_id
  public_2_subnet_id = module.vpc.public_2_subnet_id
  container_image    = var.ecs_container_image
  app_name           = var.ecs_app_name
}

# # RDS
# module "rds" {
#   source            = "./rds"
#   private_1_id      = module.vpc.private_1_subnet_id
#   private_2_id      = module.vpc.private_2_subnet_id
#   allocated_storage = var.rds_allocated_storage
#   identifier        = var.rds_identifier
#   engine            = var.rds_engine
#   engine_version    = var.rds_engine_version
#   instance_class    = var.rds_instance_class
#   db_name           = var.rds_db_name
#   username          = var.rds_username
#   password          = var.rds_password
# }

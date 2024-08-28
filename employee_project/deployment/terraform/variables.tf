variable "region" {
  type        = string
  description = "AWS region"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "managed_by" {
  type        = string
  description = "Managed by IAC code"
}

# ---------- S3 ----------
variable "s3_bucket_name" {
  type        = string
  description = "S3 Bucket name"
}

# ---------- RDS ----------
variable "rds_allocated_storage" {
  type        = string
  description = "RDS allocated storage"
}

variable "rds_engine" {
  type        = string
  description = "RDS engine"
}

variable "rds_engine_version" {
  type        = string
  description = "RDS engine version"
}

variable "rds_instance_class" {
  type        = string
  description = "RDS instance class"
}

variable "rds_db_name" {
  type        = string
  description = "RDS database name"
}

variable "rds_username" {
  type        = string
  description = "RDS database username"
}

variable "rds_password" {
  type        = string
  description = "RDS database username"
}

variable "rds_identifier" {
  type        = string
  description = "RDS database identifier name"
}


# ---------- ECS ----------
variable "ecs_app_name" {
  description = "Application name"
}

variable "ecs_container_image" {
  description = "Container image"
}

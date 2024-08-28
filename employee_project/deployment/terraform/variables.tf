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

# ---------- EKS ----------
variable "eks_cluster_name" {
  type        = string
  description = "EKS cluster name"
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

# ---------- EKS ----------
variable "eks_iam_name" {
  type        = string
  description = "EKS IAM name"
}

variable "eks_cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "eks_node_group_iam_name" {
  type        = string
  description = "EKS node group IAM name"
}

variable "eks_node_group_name" {
  type        = string
  description = "EKS node group name"
}

variable "eks_node_group_desired_size" {
  type        = string
  description = "EKS node group desired size"
}

variable "eks_node_group_max_size" {
  type        = string
  description = "EKS node group max size"
}

variable "eks_node_group_min_size" {
  type        = string
  description = "EKS node group min size"
}

variable "eks_node_group_ami_type" {
  type        = string
  description = "EKS node group ami type"
}

variable "eks_node_group_capacity_type" {
  type        = string
  description = "EKS node group capacity type"
}

variable "eks_node_group_disk_size" {
  type        = string
  description = "EKS node group disk size"
}

variable "eks_node_group_instance_type" {
  type        = string
  description = "EKS node group instance type"
}

variable "eks_cluster_version" {
  type        = string
  description = "EKS node group instance type"
}

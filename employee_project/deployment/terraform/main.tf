# # S3
module "s3" {
  source     = "./s3"
  name       = var.s3_bucket_name
  managed_by = var.managed_by
  project    = var.project
}

# VPC
module "vpc" {
  source           = "./vpc"
  managed_by       = var.managed_by
  project          = var.project
  region           = var.region
  eks_cluster_name = var.eks_cluster_name
}

# # EKS
# module "eks" {
#   source                   = "./eks"
#   managed_by               = var.managed_by
#   project                  = var.project
#   public_1_id              = module.vpc.public_1_subnet_id
#   public_2_id              = module.vpc.public_2_subnet_id
#   iam_name                 = var.eks_iam_name
#   cluster_name             = var.eks_cluster_name
#   cluster_version          = var.eks_cluster_version
#   node_group_iam_name      = var.eks_node_group_iam_name
#   node_group_name          = var.eks_node_group_name
#   node_group_desired_size  = var.eks_node_group_desired_size
#   node_group_max_size      = var.eks_node_group_max_size
#   node_group_min_size      = var.eks_node_group_min_size
#   node_group_ami_type      = var.eks_node_group_ami_type
#   node_group_instance_type = var.eks_node_group_instance_type
#   node_group_capacity_type = var.eks_node_group_capacity_type
#   node_group_disk_size     = var.eks_node_group_disk_size
# }

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

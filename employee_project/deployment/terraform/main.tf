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

# Global
project    = "praneeth-devops-test"
managed_by = "praneeth"
region     = "eu-west-1"

# S3
s3_bucket_name = "praneeth-devops-test-frontend-react-bucket"

# EKS
eks_cluster_name = "devpraneeth"

# RDS
rds_allocated_storage = 20
rds_engine            = "postgres"
rds_engine_version    = "15.4"
rds_instance_class    = "db.t3.small"
rds_identifier        = "praneeth-test-1"
rds_db_name           = "backenddb"
rds_username          = "postgres"

# EKS
eks_iam_name                 = "eks_cluster_iam"
eks_cluster_name             = "devpraneeth"
eks_cluster_version          = "1.27"
eks_node_group_iam_name      = "eks-node-group-iam-general"
eks_node_group_name          = "eks-nodes-general"
eks_node_group_desired_size  = 1
eks_node_group_min_size      = 1
eks_node_group_max_size      = 1
eks_node_group_ami_type      = "AL2_x86_64"
eks_node_group_capacity_type = "ON_DEMAND"
eks_node_group_disk_size     = 50
eks_node_group_instance_type = "t3.small"
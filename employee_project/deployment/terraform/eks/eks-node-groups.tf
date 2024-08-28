# EKS NODE POLICY
resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.eks_nodes.arn

  subnet_ids = [
    var.public_1_id,
    var.public_2_id
  ]

  scaling_config {
    desired_size = var.node_group_desired_size
    max_size     = var.node_group_max_size
    min_size     = var.node_group_min_size
  }

  ami_type      = var.node_group_ami_type
  capacity_type = var.node_group_capacity_type
  disk_size     = var.node_group_disk_size

  force_update_version = false
  instance_types       = [var.node_group_instance_type]

  labels = {
    role = "nodes-general"
  }
  version = var.cluster_version

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = {
    managed_by = var.managed_by
    project    = var.project
  }
}

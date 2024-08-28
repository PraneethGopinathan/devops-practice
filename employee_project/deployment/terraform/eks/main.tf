resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster.arn
  version  = var.cluster_version

  vpc_config {
    endpoint_private_access = false
    subnet_ids = [
      var.public_1_id,
      var.public_2_id,
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_cluster_policy
  ]

  tags = {
    managed_by = var.managed_by
    project    = var.project
  }
}

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

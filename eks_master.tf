resource "aws_eks_cluster" "harikumar" {
  name    = "harikumar-atc-xyz"
  version = "1.32"

  access_config {
    authentication_mode = "API"
  }

  role_arn = aws_iam_role.eks-master.arn

  bootstrap_self_managed_addons = false

  compute_config {
    enabled       = false
    node_pools    = ["general-purpose"]
    node_role_arn = aws_iam_role.eks-node.arn
  }

  kubernetes_network_config {
    ip_family         = "ipv4"
    service_ipv4_cidr = "192.168.0.0/16"
    elastic_load_balancing {
      enabled = false
    }
  }

  storage_config {
    block_storage {
      enabled = false
    }
  }

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true

    subnet_ids = [aws_subnet.harikumar-subnet-1.id, aws_subnet.harikumar-subnet-2.id]
  }

  # Ensure that IAM Role permissions are created before and deleted
  # after EKS Cluster handling. Otherwise, EKS will not be able to
  # properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSComputePolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSBlockStoragePolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSLoadBalancingPolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSNetworkingPolicy,
  ]
}
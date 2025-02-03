resource "aws_eks_node_group" "eks-node" {
  cluster_name    = "harikumar-atc-xyz"
  node_group_name = "eks-node"
  node_role_arn   = aws_iam_role.eks-node.arn
  subnet_ids      = [aws_subnet.harikumar-subnet-1.id, aws_subnet.harikumar-subnet-2.id]
  disk_size       = "20"
  instance_types = [
    "t3.medium",
  ]
  
  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks-node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-node-AmazonEC2ContainerRegistryReadOnly,
  ]
}
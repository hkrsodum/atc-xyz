resource "aws_eks_cluster" "atc" {
  name     = "atc"
  role_arn = aws_iam_role.eks_admin.arn
  #   status = "ACTIVE"


  vpc_config {
    subnet_ids = [aws_subnet.harikumar-subnet-1.id, aws_subnet.harikumar-subnet-2.id, aws_subnet.harikumar-subnet-3.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
  ]
}

output "endpoint" {
  value = aws_eks_cluster.atc.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.atc.certificate_authority[0].data
}

resource "aws_eks_node_group" "atc" {
  cluster_name    = aws_eks_cluster.atc.name
  node_group_name = "atc"
  node_role_arn   = aws_iam_role.eks_node.arn
  subnet_ids      = [aws_subnet.harikumar-subnet-1.id, aws_subnet.harikumar-subnet-2.id, aws_subnet.harikumar-subnet-3.id]

  scaling_config {
    desired_size = 1
    max_size     = 3
    min_size     = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}
  
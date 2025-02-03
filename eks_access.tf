# resource "aws_eks_access_entry" "harikumar" {
#   cluster_name  = aws_eks_cluster.harikumar.name
#   principal_arn = aws_iam_role.eks-master.arn
#   #   kubernetes_groups = ["group-1", "group-2"]
#   type = "STANDARD"
# }

# data "aws_caller_identity" "current" {}

# resource "aws_eks_access_policy_association" "harikumar" {
#   cluster_name  = aws_eks_cluster.harikumar.name
#   policy_arn    = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#   principal_arn = "arn:aws:iam::774305579226:root"

#   access_scope {
#     type = "cluster"
#   }
# }
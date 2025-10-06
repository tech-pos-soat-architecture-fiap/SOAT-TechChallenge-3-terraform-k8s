data "aws_iam_user" "principal_user" {
  user_name = "11soat-edir"
} 

data "aws_eks_cluster" "cluster" {
  name = aws_eks_cluster.cluster.name
}

data "aws_eks_cluster_auth" "auth" {
  name = aws_eks_cluster.cluster.name
}

# data "aws_lb" "eks_nlb" {
#   tags = {
#     "kubernetes.io/cluster/${aws_eks_cluster.cluster.name}" = "owned"
#   }
#   depends_on = [ aws_eks_cluster.cluster ]
# }


# data "aws_iam_policy_document" "lambda_assume_role" {
#   statement {
#     actions = ["sts:AssumeRole"]
#     principals {
#       type        = "Service"
#       identifiers = ["lambda.amazonaws.com"]
#     }
#   }
# }
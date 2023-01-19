resource "aws_eks_addon" "addons" {
  cluster_name             = module.eks.cluster_id
  addon_name               = "aws-ebs-csi-driver"
  resolve_conflicts        = "OVERWRITE"
  service_account_role_arn = aws_iam_role.ebs-csi-role.arn
}

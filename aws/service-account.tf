resource "kubernetes_service_account" "alb_sa" {
    depends_on      = [module.eks]
    metadata {
        name        = "aws-load-balancer-controller"
        namespace   = "kube-system"
        annotations = {
            "eks.amazonaws.com/role-arn": aws_iam_role.elb_role.arn
        }
        labels      = {
            "app.kubernetes.io/component": "controller",
            "app.kubernetes.io/name":  "aws-load-balancer-controller"
        }
    }
}

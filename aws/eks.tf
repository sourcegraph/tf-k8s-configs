module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.26.6"

  cluster_name    = local.cluster_name
  cluster_version = "1.24"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  node_security_group_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = null
  }

  eks_managed_node_group_defaults = {
    # Amazon Linux 2 x86_64: https://aws.amazon.com/marketplace/pp/prodview-zc4x2k7vt6rpu
    ami_type = "AL2_x86_64"

    attach_cluster_primary_security_group = true

    # Disabling and using externally provided security groups
    create_security_group = false
  }

  eks_managed_node_groups = {
    default = {
      name = "sg-node-group-1"

      instance_types = var.node_group_one_instance_types

      min_size     = var.node_group_one_min_size
      max_size     = var.node_group_one_max_size
      desired_size = var.node_group_one_desired_size

      vpc_security_group_ids = [
        aws_security_group.node_group_one.id
      ]

      tags = {
        "k8s.io/cluster-autoscaler/${local.cluster_name}" = "owned"
        "k8s.io/cluster-autoscaler/enabled"               = true
      }
    }
  }
}
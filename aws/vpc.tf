module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "${var.deployment_name}-replica-env-vpc"

  cidr = "10.0.0.0/16"
  azs  = slice(data.aws_availability_zones.available.names, 0, 2)

  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets   = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  database_subnets = var.create_rds_dbs || var.create_rds_single_db ? ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"] : []

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
}

resource "aws_db_subnet_group" "sourcegraph_dbs_subnet_group" {
  count = var.create_rds_dbs || var.create_rds_single_db ? 1 : 0

  name       = "sourcegraph_dbs_subnet_group"
  subnet_ids = module.vpc.database_subnets

  tags = {
    Name = "Sourcegraph DBs"
  }
}

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 4.0"

  project_id   = var.project_id
  network_name = "vpc-terraform-${var.deployment_name}"

  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = var.region
    },
    {
      subnet_name           = "subnet-02"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = var.region
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    },
  ]

  secondary_ranges = {
    subnet-01 = [
      {
        range_name    = "subnet-01-gke-01-pods"
        ip_cidr_range = "192.168.0.0/16"
      },
      {
        range_name    = "subnet-01-gke-01-services"
        ip_cidr_range = "192.170.68.0/24"
      }
    ]
  }
}

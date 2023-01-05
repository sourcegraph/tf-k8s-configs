terraform {
  required_version = ">=0.13"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.29.0, < 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.10"
    }
  }
  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-kubernetes-engine/v23.1.0"
  }
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

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

module "gke" {
  depends_on                 = [module.vpc]
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = var.deployment_name
  region                     = var.region
  network                    = module.vpc.network_name
  subnetwork                 = "subnet-01"
  ip_range_pods              = "subnet-01-gke-01-pods"
  ip_range_services          = "subnet-01-gke-01-services"
  http_load_balancing        = true
  network_policy             = false
  horizontal_pod_autoscaling = false
  filestore_csi_driver       = false

  cluster_autoscaling = {
    enabled       = true
    min_cpu_cores = var.min_cpu_cores
    min_memory_gb = var.min_memory_gb
    max_cpu_cores = var.max_cpu_cores
    max_memory_gb = var.max_memory_gb
    gpu_resources = var.gpu_resources
  }

  node_pools = [
    {
      name               = "default-node-pool"
      machine_type       = var.instance_type
      min_count          = var.node_min_count
      max_count          = var.node_max_count
      local_ssd_count    = 0
      spot               = false
      disk_size_gb       = 100
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      enable_gcfs        = false
      enable_gvnic       = false
      auto_repair        = true
      auto_upgrade       = true
      service_account    = "${var.service_account}@${var.project_id}.iam.gserviceaccount.com"
      preemptible        = false
      initial_node_count = var.node_desired_count
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }
}

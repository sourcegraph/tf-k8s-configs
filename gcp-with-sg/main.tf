resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = "https://${module.gke.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(module.gke.ca_certificate)
  }
}

module "my-app-workload-identity" {
  source     = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  name       = "${var.deployment_name}-sa"
  namespace  = "default"
  project_id = var.project_id
  roles      = ["roles/storage.admin", "roles/compute.admin"]
}

module "gke" {
  depends_on                 = [module.vpc]
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = "${var.deployment_name}-${random_string.suffix.result}"
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
      service_account    = module.my-app-workload-identity.gcp_service_account_email
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

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}

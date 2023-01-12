variable "project_id" {
  type        = string
  default     = "my project id"
  description = "the project id for the GCP project to deploy on"
}

variable "deployment_name" {
  type        = string
  default     = "organization"
  description = "name of your organization"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "region to deploy cluster to"
}

variable "zones" {
  type        = list(string)
  default     = ["us-central1-a"]
  description = "zones to deploy cluster to"
}

### Autoscaling variables ###
variable "min_cpu_cores" {
  type        = number
  default     = 0
  description = "Minimum total CPU cores for auto-scaling nodes"
}

variable "min_memory_gb" {
  type        = number
  default     = 0
  description = "Minimum total GB of memory for auto-scaling nodes"
}

variable "max_cpu_cores" {
  type        = number
  default     = 100
  description = "Maximum total CPU cores for auto-scaling nodes"
}

variable "max_memory_gb" {
  type        = number
  default     = 100
  description = "Maximum total GB of memory for auto-scaling nodes"
}

variable "gpu_resources" {
  type        = list(any)
  default     = []
  description = "GPU Accelerator resources to provision. Object containing resource_type (string), minimum (number), and maximum (number)"
}

### Node pool variables ###
variable "instance_type" {
  type        = string
  default     = "e2-medium"
  description = "The instance type for the nodes in the cluster"
}

variable "node_min_count" {
  type        = number
  default     = 1
  description = "Minimum number of nodes to be available in the node pool"
}

variable "node_max_count" {
  type        = number
  default     = 100
  description = "Maximum number of nodes to be available in the node pool"
}

variable "service_account" {
  type        = string
  default     = "project-service-account"
  description = "Service account name in the service account email"
}

variable "node_desired_count" {
  type        = number
  default     = 1
  description = "Desired number of nodes to be available in the node pool"
}

### GCP Variables ###
variable "project_id" {
    type        = string
    default     = "my-terraform-project"
    description = "The project ID for the GCP project to deploy on"
}

variable "region" {
  type        = string
  default     = "us-east1"
  description = "GCP Region to deploy Sourcegraph in"
}


### Sourcegraph Deployment Variables ###
variable "deployment_name" {
  type        = string
  default     = "company_name"
  description = "The name of the company or deployment"
}

variable "sourcegraph_version" {
  type        = string
  default     = "4.0.1"
  description = "Sourcegraph version to install"
}

variable "ssl_domain" {
  type        = string
  default     = "sourcegraph.example.com"
  description = "Set the hostname for your Sourcegraph instance"
}

### Node Pool Variables ###
variable "instance_type" {
    type        = string
    default     = "e2-medium"
    description = "The instance type for the nodes in the cluster"
}

variable "node_min_count" {
  type        = number
  default     = 0
  description = "Minimum number of nodes to be available in the node pool"
}

variable "node_max_count" {
  type        = number
  default     = 10
  description = "Maximum number of nodes to be available in the node pool"
}

variable "node_desired_count" {
  type        = number
  default     = 1
  description = "Desired number of nodes to be available in the node pool"
}

### Autoscaling Variables ###
variable "autoscaling_enabled" {
  type        = bool
  default     = true
  description = "Should node autoscaling be enabled or not? If true, all of min_cpu_cores, min_memory_gb, max_cpu_cores, max_memory_gb, and gpu_resources must be set"
}

variable "min_cpu_cores" {
  type        = number
  default     = 0
  description = "Minimum total CPU Cores for autoscaling nodes"
}

variable "min_memory_gb" {
  type        = number
  default     = 0
  description = "Minimum total GB of memory for autoscaling nodes"
}

variable "max_cpu_cores" {
  type        = number
  default     = 100
  description = "Maximum total CPU Cores for autoscaling nodes"
}

variable "max_memory_gb" {
  type        = number
  default     = 100
  description = "Maximum total GB of memory for autoscaling nodes"
}

variable "gpu_resources" {
  type        = list
  default     = []
  description = "GPU Accelerator resources to provision. Object containing resource_type (string), minimum (number), and maximum (number)"
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
  default     = "sourcegraph-cluster"
}

variable "location" {
  description = "location of the cluster being deployed"
  type        = string
  default     = "eastus"
}

variable "node_pool_name" {
  description = "name of the default node pool"
  type        = string
  default     = "sgnodes"
}

variable "max_count" {
  description = "max number of nodes on the default node pool"
  type        = string
  default       = 6
}

variable "min_count" {
  description = "min number of nodes on the default node pool"
  type        = string
  default       = 2
}

variable "node_count" {
  description = "number of nodes on the default node pool"
  type        = string
  default       = 4
}

variable "instance_type" {
  description = "machine type for default node pool"
  type        = string
  default       = "standard_d16s_v3"
}

variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}

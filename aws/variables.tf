variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-1"
}

variable "deployment_name" {
  description = "Name for this deployment"
  type        = string
  default     = "sourcegraph-cluster"
}

### Node Group One ###
variable "node_group_one_instance_types" {
  description = "Instance types to use in node group one"
  type        = list(any)
  default     = ["m6a.4xlarge"]
}
variable "node_group_one_min_size" {
  description = "Minimum number of nodes in node group one"
  type        = number
  default     = 2
}
variable "node_group_one_max_size" {
  description = "Maximum number of nodes in node group one"
  type        = number
  default     = 6
}
variable "node_group_one_desired_size" {
  description = "Desired number of nodes in node group one"
  type        = number
  default     = 4
}

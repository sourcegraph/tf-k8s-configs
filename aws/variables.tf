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

### RDS Switch ###
variable "create_rds" {
  type    = bool
  default = false
}

### RDS DB connection strings

### Frontend DB ###
variable "frontend_db_name" {
  description = "Name for the codeintel database"
  type        = string
  default     = "frontend"
}

variable "frontend_db_username" {
  description = "Name for the codeintel database"
  type        = string
  default     = "sg"
}

variable "frontend_db_password" {
  description = "Frontend database password"
  type        = string
  sensitive   = true
}

variable "frontend_db_instance_class" {
  description = "EC2 machine type"
  type        = string
  default     = "db.m5.4xlarge"
}


variable "frontend_db_allocated_storage" {
  description = "DB allocated storage"
  type        = number
  default     = 100
}

### codeintel DB ###
variable "codeintel_db_name" {
  description = "Name for the codeintel database"
  type        = string
  default     = "codeintel"
}

variable "codeintel_db_username" {
  description = "Name for the codeintel database"
  type        = string
  default     = "sg"
}

variable "codeintel_db_password" {
  description = "Codeintel database password"
  type        = string
  sensitive   = true
}

variable "codeintel_db_instance_class" {
  description = "EC2 machine type"
  type        = string
  default     = "db.m5.4xlarge"
}

variable "codeintel_db_allocated_storage" {
  description = "DB allocated storage"
  type        = number
  default     = 100
}


### codeinsights DB ###
variable "codeinsights_db_name" {
  description = "Name for the codeintel database"
  type        = string
  default     = "codeintel"
}

variable "codeinsights_db_username" {
  description = "Name for the codeintel database"
  type        = string
  default     = "sg"
}

variable "codeinsights_db_password" {
  description = "Codeinsights database password"
  type        = string
  sensitive   = true
}

variable "codeinsights_db_instance_class" {
  description = "EC2 machine type"
  type        = string
  default     = "db.m5.4xlarge"
}

variable "codeinsights_db_allocated_storage" {
  description = "DB allocated storage"
  type        = number
  default     = 100
}


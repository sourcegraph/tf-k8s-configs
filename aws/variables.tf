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

### RDS Switchs ###
# Database resources will be provisioned only if the relevant variables are set to true. 
# create_rds_dbs=true creates an rds instance for each db, i.e. pgsql, codeinsights-db, and codeintel-db.
# create_rds_single_db=true creates a single rds instance for all dbs.
variable "create_rds_dbs" {
  type    = bool
  default = false
}

### RDS DB connection strings

### pgsql DB ###
variable "pgsql_db_name" {
  description = "Name for the codeintel database"
  type        = string
  default     = "sg"
}

variable "pgsql_db_username" {
  description = "Name for the codeintel database"
  type        = string
  default     = "sg"
}

variable "pgsql_db_password" {
  description = "pgsql database password"
  type        = string
  sensitive   = true
}

variable "pgsql_db_instance_class" {
  description = "EC2 machine type"
  type        = string
  default     = "db.t3.medium"
}


variable "pgsql_db_allocated_storage" {
  description = "DB allocated storage"
  type        = number
  default     = 100
}

variable "pgsql_db_final_snapshot_identifier" {
  description = "Final snapshot identifier"
  type        = string
  default     = "pgsqlFinalSnapshot"
}

### codeintel DB ###
variable "codeintel_db_name" {
  description = "Name for the codeintel database"
  type        = string
  default     = "sg"
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
  default     = "db.t3.medium"
}

variable "codeintel_db_allocated_storage" {
  description = "DB allocated storage"
  type        = number
  default     = 100
}

variable "codeintel_db_final_snapshot_identifier" {
  description = "Final snapshot identifier"
  type        = string
  default     = "codeintelDbFinalSnapshot"
}


### codeinsights DB ###
variable "codeinsights_db_name" {
  description = "Name for the codeintel database"
  type        = string
  default     = "postgres"
}

variable "codeinsights_db_username" {
  description = "Name for the codeintel database"
  type        = string
  default     = "postgres"
}

variable "codeinsights_db_password" {
  description = "Codeinsights database password"
  type        = string
  sensitive   = true
}

variable "codeinsights_db_instance_class" {
  description = "EC2 machine type"
  type        = string
  default     = "db.t3.medium"
}

variable "codeinsights_db_allocated_storage" {
  description = "DB allocated storage"
  type        = number
  default     = 100
}

variable "codeinsights_db_final_snapshot_identifier" {
  description = "Final snapshot identifier"
  type        = string
  default     = "codeinsightsDbFinalSnapshot"
}

### RDS Single DB ###

variable "create_rds_single_db" {
  type    = bool
  default = false
}

variable "dbs_name" {
  description = "Name for the initial database"
  type        = string
  default     = "sourcegraph"
}

variable "dbs_username" {
  description = "Name for the initial user"
  type        = string
  default     = "sg"
}

variable "dbs_password" {
  description = "Initial database password"
  type        = string
  sensitive   = true
}

variable "dbs_instance_class" {
  description = "EC2 machine type"
  type        = string
  default     = "db.r5.2xlarge"
}

variable "dbs_allocated_storage" {
  description = "DB allocated storage"
  type        = number
  default     = 300
}

variable "dbs_final_snapshot_identifier" {
  description = "Final snapshot identifier"
  type        = string
  default     = "sourcegraphFinalSnapshot"

}
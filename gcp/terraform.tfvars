### Detailed descriptions of each variable can be found in variables.tf ###

### GCP Variables ###
# project_id = "default-project-name"
# region = "us-central1"
# zones = ["us-central1-a"]

### Deployment Variables ###
# deployment_name = "sourcegraph-cluster"

### Node Pool Variables ###
## OPTIONAL - add your own service account ##
# service_account = "project-service-account"
# instance_type = "n1-standard-32"
# node_min_count = 0
# node_max_count = 4
# node_desired_count = 2

### Autoscaling Variables ###
# min_cpu_cores = 1
# min_memory_gb = 1
# max_cpu_cores = 100
# max_memory_gb = 100
# gpu_resources = []

### AWS Region ###
region = "us-west-1"

### Deployment Name ###
deployment_name = "sourcegraph-cluster"

### Node Group One Customizations ###
node_group_one_instance_types = ["m6a.4xlarge"]
node_group_one_min_size       = 2
node_group_one_max_size       = 6
node_group_one_desired_size   = 4

### frontend db connection strings ###
frontend_db_name              = "frontend"
frontend_db_username          = "sg"
frontend_db_instance_class    = "db.t3.medium"
frontend_db_allocated_storage = 500

### codeinteldb connection strings ###
codeintel_db_name              = "codeintel"
codeintel_db_username          = "sg"
codeintel_db_instance_class    = "db.t3.medium"
codeintel_db_allocated_storage = 500

### codeinsights db connection strings ###
codeinsights_db_name              = "codeinsights"
codeinsights_db_username          = "sg"
codeinsights_db_instance_class    = "db.t3.medium"
codeinsights_db_allocated_storage = 500
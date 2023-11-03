### AWS Region ###
region = "us-west-1"

### Deployment Name ###
deployment_name = "sourcegraph-cluster"

### Node Group One Customizations ###
node_group_one_instance_types = ["m6a.4xlarge"]
node_group_one_min_size       = 2
node_group_one_max_size       = 6
node_group_one_desired_size   = 4

### pgsql db connection strings ###
pgsql_db_name              = "sg"
pgsql_db_username          = "sg"
pgsql_db_password          = "todo-generate-passwords"
pgsql_db_instance_class    = "db.t3.medium"
pgsql_db_allocated_storage = 150

### codeinteldb connection strings ###
codeintel_db_name              = "sg"
codeintel_db_username          = "sg"
codeintel_db_password          = "todo-generate-passwords"
codeintel_db_instance_class    = "db.t3.medium"
codeintel_db_allocated_storage = 150

### codeinsights db connection strings ###
codeinsights_db_name              = "postgres"
codeinsights_db_username          = "postgres"
codeinsights_db_password          = "todo-generate-passwords"
codeinsights_db_instance_class    = "db.t3.medium"
codeinsights_db_allocated_storage = 150

### sourcegraph-dbs initial db connection strings ###
dbs_name              = "sourcegraph"
dbs_username          = "sg"
dbs_password          = "todo-generate-passwords"
dbs_instance_class    = "db.r5.2xlarge"
dbs_allocated_storage = 500

## TODOS: delete when done. 
- One node group
- Auto scaling on the node group
- Configure with Container Storage Interfaces (CSI) storage drivers
  - More info [here](https://learn.microsoft.com/en-us/azure/aks/csi-storage-drivers).
- 

### Prerequisites
1. An Azure account
2. The `az` CLI, [installed](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) and [logged in](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli).
3. Create an active directory service principal with the following command (must be logged in first): `az ad sp create-for-rbac --skip-assignment`. You will use the output from these commands to set your variables in `terraform.tfvars`, so hold on to it.

### Set your variables
1. Clone this repository to your local machine. 
2. Uncomment and replace variables in `terraform.tfvars` with the desired values. Check `variables.tf` for default values.

### Deploy the cluster
From inside the `./azure` directory of this project
1. Run `terraform init`. This will initialize the terraform project.
2. Run `terraform plan`. This will perform a dry run and find any problems with your configuration.
3. Run `terraform apply`. This will deploy the cluster to Azure. Type 'yes' at the prompt

Congrats! You have a Kubernetes cluster! Next, [it's time to deploy Sourcegraph](https://docs.sourcegraph.com/admin/deploy/kubernetes/configure)!

### Destroy the Cluster
1. Run `terraform destroy`. Answer yes at the prompt.


## Prerequisites
1. An Azure account
2. The Azure CLI, [installed](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) and [logged in](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli).
3. Associate your azure account with a [subscription](https://github.com/MicrosoftDocs/azure-docs/blob/main/articles/cost-management-billing/manage/create-subscription.md). 
3. Create an Azure Active Directory service principal with the following command (must be [logged in](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli) first):
    ```bash
    az ad sp create-for-rbac --skip-assignment
    ```
   You will use the output from these commands to set your variables in `terraform.tfvars`, so hold on to it.

## Set your variables
Uncomment and replace variables in `terraform.tfvars` with the desired values generated in the prerequisites. Check `variables.tf` for default values.

## Deploy the cluster
From inside the `./azure` directory of this project:
1. Run `terraform init`. This will initialize the Terraform project.
2. Run `terraform plan`. This will perform a dry run and find any problems with your configuration.
3. Run `terraform apply`. This will deploy an AKS cluster to Azure. Type yes at the prompt.

It will take a few minutes to deploy the cluster. When finished, you will be greeted with a success message.
Congratulations! You have a Kubernetes cluster. Next, it's time to [deploy Sourcegraph](https://docs.sourcegraph.com/admin/deploy/kubernetes/configure).

## Manage Your Cluster with Kubectl
To manage your cluster, you can use the `kubectl` [cli tool](https://kubernetes.io/docs/tasks/tools/), which you'll need to configure cluster access for.

1. Set your env variables:
    ```bash
    export RESOURCE_GROUP=<the region code for your cluster>
    export CLUSTER_NAME=<the name of your cluster on GCP or AWS>
    ```
2. Run the following command:
    ```bash
    az aks get-credentials --resource-group $RESOURCE_GROUP --name $CLUSTER_NAME
    ```
3. Run `kubectl config current-context` to make sure `kubectl` is pointing to your AKS cluster.

## Destroy the cluster
1. Run `terraform destroy`. Answer yes at the prompt.

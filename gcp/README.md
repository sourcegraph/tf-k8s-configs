## Provision a GKE cluster on GCP

### Prerequisites
1. Create a project in GCP and enable Google Kubernetes Engine (GKE) for the project.
2. Install [`gcloud`](https://cloud.google.com/sdk/docs/install). Then set the project:
   ```bash
   gcloud config set project <project name>
   ```
3. [OPTIONAL] Create a service account. If you choose not to, terraform will provision one for you during the `apply` step. To create your own follow the steps below:

> - Go to the [create service account](https://console.cloud.google.com/apis/credentials/serviceaccountkey) key page
> - Select the default service account or create a new one
> - Select JSON as the key type
> - Click Create
> - Save this JSON file in the `~/.config/gcloud/` directory (you can rename it)

### Set your variables
1. If you haven't already, fork and clone this repository to your local machine.
2. `cd` into `./gcp`, then uncomment and replace variables in `terraform.tfvars` with the desired values. Check `variables.tf` for default values.

### Deploy the cluster
From inside the `./gcp` directory of this project:
1. Run `terraform init`. This will initialize the terraform project.
2. Run `terraform plan`. This will perform a dry run and find any problems with your configuration.
3. Run `terraform apply`. This will deploy the cluster to the specified GCP project. Type 'yes' at the prompt.

It will take a few minutes to deploy the cluster. When finished, you will be greeted with a success message.
Next, [deploy Sourcegraph](https://docs.sourcegraph.com/admin/deploy/kubernetes/configure) onto the cluster you just provisioned.

## Manage Your Cluster with Kubectl
To manage your cluster, you can use the `kubectl` [cli tool](https://kubernetes.io/docs/tasks/tools/), which you'll need to configure cluster access for.

1. Set your env variables:
    ```bash
    export REGION=<region code for your cluster>
    export CLUSTER_NAME=<the name of your cluster on GCP or AWS>
    ```
2. Run the following command:
    ```bash
    gcloud container clusters --region=$REGION get-credentials $CLUSTER_NAME
    ```
3. Run `kubectl config current-context` to make sure `kubectl` is pointing to your GKE cluster.

### Destroy the Cluster
1. Run `terraform destroy`. Answer yes at the prompt.


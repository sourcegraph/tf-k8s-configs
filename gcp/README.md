## Provision a GKE cluster on GCP

### Prerequisites

1. Create a project in GCP and enable Google Kubernetes Engine (GKE) for the project.
2. Install [`gcloud`](https://cloud.google.com/sdk/docs/install) and [`terraform`](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) on your local machine.
3. [OPTIONAL] Create a service account. If you choose not to, terraform will provision one for you during the `apply` step. To create your own follow the steps below:

> - Go to the [create service account](https://console.cloud.google.com/apis/credentials/serviceaccountkey) key page
> - Select the default service account or create a new one
> - Select JSON as the key type
> - Click Create
> - Save this JSON file in the ~/.config/gcloud/ directory (you can rename it)

### Set your variables

1. Clone this repository to your local machine.
2. Replace variables in `terraform.tfvars` with the desired values. Check `variables.tf` for default values.

### Deploy the cluster

From inside the cloned directory:

1. Run `terraform init`. This will initialize the terraform project.
2. Run `terraform plan`. This will perform a dry run and find any problems with your configuration.
3. Run `terraform apply`. This will deploy the cluster to the specified GCP project. Type 'yes' at the prompt.

Congrats. You have a Kubernetes cluster. Next, [it's time to deploy Sourcegraph](https://docs.sourcegraph.com/admin/deploy/kubernetes/configure).

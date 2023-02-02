# Provision a GKE Cluster with Sourcegraph via Terraform

This repo uses the [gke module](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/) to provision a GKE cluster, necessary add-ons, and Sourcegraph on that cluster.

## Setup

### Edit Variables

In `terraform.tfvars`, uncomment the variables you wish to override their default values (as found in `variables.tf`) and set new values. For the Instance Type in each node group, this should be an array of strings. All variable types can be seen in `variables.tf`.

### Create override.yaml

Using the [Resource Estimator](https://docs.sourcegraph.com/admin/deploy/resource_estimator) and the information outlined in the [helm documentation](https://docs.sourcegraph.com/admin/deploy/kubernetes/helm#configure-sourcegraph-on-google-kubernetes-engine-gke) to generate an `override.yaml` file and move it into the `resources` directory

## Deploy

Once the setup has been completed, you can run `terraform init` to ensure everything is initialized correctly, and then run `terraform plan` to see the expected output. When ready to build the cluster, run `terraform apply`. This plan assumes you have the gcloud CLI configured for your GCP account you wish to deploy on.

## Managing your deployment

To update your kubeconfig to use the newly created cluster, run the following commands:

``` sh
export REGION=$(terraform output -raw region)
export CLUSTER_NAME=$(terraform output -raw cluster_id)
gcloud container clusters get-credentials $CLUSTER_NAME --region $REGION
```

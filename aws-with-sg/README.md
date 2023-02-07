# Provision an EKS Cluster with Sourcegraph via Terraform

This repo uses the [eks module](https://github.com/terraform-aws-modules/terraform-aws-eks) to provision an EKS cluster, and will additionally deploy the AWS Load Balancer Controller, the CSI EBS add on, and Sourcegraph on that cluster.

## Setup

### Edit Variables

In `terraform.tfvars`, uncomment the variables you wish to override their default values (as found in `variables.tf`) and set new values. For the Instance Type in each node group, this should be an array of strings. All variable types can be seen in `variables.tf`.

### Create override.yaml

Using the [Resource Estimator](https://docs.sourcegraph.com/admin/deploy/resource_estimator) and the information outlined in the (helm documentation)[https://docs.sourcegraph.com/admin/deploy/kubernetes/helm#configure-sourcegraph-on-elastic-kubernetes-service-eks] to generate an `override.yaml` file and move it into the `resources` directory

## Deploy

Once the setup has been completed, you can run `terraform init` to ensure everything is initialized correctly, and then run `terraform plan` to see the expected output. When ready to build the cluster, run `terraform apply`. This plan assumes you have the AWS CLI configured for your AWS account you wish to deploy on.

## Managing your deployment

To update your kubeconfig to use the newly created cluster, run the following commands:

``` sh
export REGION=$(terraform output -raw region)
export CLUSTER_NAME=$(terraform output -raw cluster_name)
aws eks --region $REGION update-kubeconfig --name $CLUSTER_NAME
```
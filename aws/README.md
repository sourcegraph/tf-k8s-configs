## Provision an EKS cluster in AWS

### Prerequisites
1. An AWS [account](https://portal.aws.amazon.com/billing/signup?nc2=h_ct&src=default&redirect_url=https%3A%2F%2Faws.amazon.com%2Fregistration-confirmation#/start)
2. the AWS CLI v2.7.0/v1.24.0 or newer, [installed](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and [configured](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
3. [AWS IAM Authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)

### Set Your Variables
Uncomment and replace variables in `terraform.tfvars` with the desired values. Check `variables.tf` for default values.

### Deploy the Cluster
From inside the `./aws` directory of this project:
1. Run `terraform init`. This will initialize the terraform project.
2. Run `terraform plan`. This will perform a dry run and find any problems with your configuration.
3. Run `terraform apply`. This will deploy the cluster to AWS. Type 'yes' at the prompt.

It will take a few minutes to deploy the cluster. When finished, you will be greeted with a success message.
Next, [deploy Sourcegraph](https://docs.sourcegraph.com/admin/deploy/kubernetes/configure).

## Manage Your Cluster with Kubectl
To manage your cluster, you can use the `kubectl` [command line tool](https://kubernetes.io/docs/tasks/tools/), which you'll need to configure cluster access for.

1. Set your env variables:
    ```bash
    export REGION=<region code for your cluster>
    export CLUSTER_NAME=<the name of your cluster on GCP or AWS>
    ```
2. Run the following command:
    ```bash
    aws eks update-kubeconfig --region $REGION --name $CLUSTER_NAME
    ```
3. Run `kubectl config current-context` to make sure `kubectl` is pointing to your EKS cluster.

### Destroy the Cluster
1. Run `terraform destroy`. Answer yes at the prompt.

### RDS databases

**!!!WARNING these rds instances are insecure and should not be used in production, or with sensitive data. Do not load private repo!!!**

To provision seperate RDS databases for each DB run `terraform apply -var='create_rds_dbs=true'`. For a single RDS instance to be configured with all dbs run `terraform apply -var='create_rds_single_db=true'`.





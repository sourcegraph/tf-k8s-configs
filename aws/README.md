## Provision an EKS cluster in AWS

### Prerequisites
1. An AWS [account](https://portal.aws.amazon.com/billing/signup?nc2=h_ct&src=default&redirect_url=https%3A%2F%2Faws.amazon.com%2Fregistration-confirmation#/start)
2. the AWS CLI v2.7.0/v1.24.0 or newer, [installed](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and [configured](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
3. [AWS IAM Authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)

### Set Your Variables
1. Clone this repository to your local machine.
2. Uncomment and replace variables in `terraform.tfvars` with the desired values. Check `variables.tf` for default values.

### Deploy the Cluster
From inside the cloned directory:
1. Run `terraform init`. This will initialize the terraform project.
2. Run `terraform plan`. This will perform a dry run and find any problems with your configuration.
3. Run `terraform apply`. This will deploy the cluster to AWS. Type 'yes' at the prompt.

### Destroy the Cluster
1. Run `terraform destroy`. Answer yes at the prompt.

Congrats! you have a Kubernetes cluster! Next, [it's time to deploy Sourcegraph](https://docs.sourcegrapn.com/admin/deploy/kubernetes/configure)




## Deploy a Kubernetes Cluster with Terraform
This module provides Terraform configurations for: 

1. Provisioning a Kubernetes cluster on AWS, GCP or Azure.
2. Provisioning a Kubernetes cluster __with__ a Sourcegraph instance on GCP or AWS.

These configurations should be treated as illustrative examples, not production-ready infrastructure configuration.

### Get Started - Deploying a Kubernetes Cluster
- Install [terraform](https://developer.hashicorp.com/terraform/downloads)
- `cd` into the directory corresponding to your cloud provider (aws, gcp, or azure) and follow the instructions in the README in that directory.
- Monitor the Terraform output and wait for your cluster to deploy
- Next, [deploy Sourcegraph](https://docs.sourcegraph.com/admin/deploy/kubernetes)

### Get Started - Deploying a Kubernetes Cluster + Sourcegraph
- Install [terraform](https://developer.hashicorp.com/terraform/downloads)
- `cd` into `aws-with-sg` or `gcp-with-sg` and follow the instructions in the README.

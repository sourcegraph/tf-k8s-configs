### Deploy a Kubernetes Cluster

Pick the platform you want to deploy your cluster to, and follow the instructions in the README of the corresponding directory.

## Managing Your Cluster with Kubectl
Follow these steps after you've deployed your cluster to AWS or GCP. 

To manage your cluster, you can use the `kubectl` [cli tool](https://kubernetes.io/docs/tasks/tools/), which you'll need to configure cluster access for.

1. For both commands you'll need to set the env variables first:
    ```bash
    export $REGION=<the region code for your cluster>
    export $CLUSTER_NAME=<the name of your cluster on GCP or AWS>
    ```

2. If you are using [`gcloud`](https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl), configure `kubectl` by running:

`gcloud container clusters --region=$REGION get-credentials $CLUSTER_NAME`

3. If you are using [`aws`](https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html), configure `kubectl` by running:

`aws eks update-kubeconfig --region $REGION --name $CLUSTER_NAME`

4. If you are using [`az`](https://learn.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest#az-aks-get-credentials), configure `kubectl` by running:

`az aks get-credentials --resource-group [resource-group-name] --name [aks-cluster-name]

4. Run `kubectl config current-context` to see the current context
5. (Optionally) Run `kubectl cluster-info` to see information about the current cluster

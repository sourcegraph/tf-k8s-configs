### Deploy a Kubernetes Cluster

Pick the platform you want to deploy your cluster to, and follow the instructions in the README of the corresponding directory.

## Managing Your Cluster with Kubectl
To manage your cluster, you can use the `kubectl` [cli tool](https://kubernetes.io/docs/tasks/tools/), which you'll need to configure cluster access for.

1. For both commands you'll need to set the env variables first:
    ```
    export $REGION=<the region code for your cluster>
    export $CLUSTER_NAME=<the name of your cluster on GCP or AWS>
    ```

2. With [`gcloud`](https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl). You can do so with the following command:

`gcloud container clusters --region=$REGION get-credentials $CLUSTER_NAME`

3. With [`aws`](https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html)

`aws eks update-kubeconfig --region $REGION --name $CLUSTER_NAME`

4. Run `kubectl cluster-info` to test if it worked.

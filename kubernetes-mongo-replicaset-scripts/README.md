Run mongo in Kubernetes with replicaset using scripts

1. First create the PersistentVolume and PersistentVolumeClaim
    ```
    kubectl apply -f mongo-persistent-storage.yaml
    ```

2. Now create the statefulset
    ```
    kubectl apply -f mongo-statefulset-replicaset.yaml
    ```

3. Verify the deployment
    ```
    kubectl get all
    ```

As described here, but on Local/Custom kubernetes cluster:

https://github.com/pkdone/gke-mongodb-demo

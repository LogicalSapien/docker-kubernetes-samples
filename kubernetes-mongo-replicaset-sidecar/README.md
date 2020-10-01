Run mongo in Kubernetes

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

As described in this blogpost:

https://kubernetes.io/blog/2017/01/running-mongodb-on-kubernetes-with-statefulsets/

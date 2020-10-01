Run mongo in Kubernetes

1. First create the PersistentVolume and PersistentVolumeClaim
    ```
    kubectl apply -f mongo-persistent-storage.yaml
    ```

2. Now create the statefulset
    ```
    kubectl apply -f mongo-statefulset.yaml
    ```

3. Verify the deployment
    ```
    kubectl get all
    ```

4. Start Robomongo and connect
    Might need the ip address and nodeport from `kubectl get service`

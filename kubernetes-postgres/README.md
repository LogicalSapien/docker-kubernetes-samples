Run SonarQube in Kubernetes

1. First create the PersistentVolume and PersistentVolumeClaim
    ```
    kubectl apply -f postgres-persistent-storage.yaml
    ```

2. Now create the statefuul set
    ```
    kubectl apply -f postgres-statefulset.yaml
    ```

3. Verify the deployment
    ```
    kubectl get all
    ```

4. Start Pgadmin and try connecting
    ```
    kubectl get all
    ```
    Might need the ip address and nodeport from `kubectl get service`

5. 
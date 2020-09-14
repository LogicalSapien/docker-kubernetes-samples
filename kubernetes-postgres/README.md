Run Postgres in Kubernetes

1. First create the PersistentVolume and PersistentVolumeClaim
    ```
    kubectl apply -f postgres-persistent-storage.yaml
    ```

2. Now create the statefulset
    ```
    kubectl apply -f postgres-statefulset.yaml
    ```

3. Verify the deployment
    ```
    kubectl get all
    ```

4. Start Pgadmin and try connecting
    ```
    docker run -p 80:80 \
    -e 'PGADMIN_DEFAULT_EMAIL=user@domain.com' \
    -e 'PGADMIN_DEFAULT_PASSWORD=admin123' \
    -d dpage/pgadmin4

    kubectl get service
    ```
    Might need the ip address and nodeport from `kubectl get service`
    Pgadmin available at localhost

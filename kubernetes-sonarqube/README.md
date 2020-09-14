Run SonarQube in Kubernetes

1. First create the PersistentVolume and PersistentVolumeClaim
    ```
    kubectl apply -f sonarqube-persistent-storage.yaml
    ```

2. Now create a secret for db password. this can be done via cli as well.
    In the secrets file, you need to have the values base64 encoded
    ```
    echo -n 'admin' | base64
    kubectl apply -f sonarqube-postgres-secret.yaml
    ```
3. Create the deployment
    ```
    kubectl apply -f sonarqube-deployment.yaml
    ```
4. Verify the deployment
    ```
    kubectl get all
    ```
5. sonarqube can be accessed via the public IP you get from `kubectl get service`

apiVersion: apps/v1
kind: Deployment
metadata:
  name: wio-k8s
  labels:
    app: wio-k8s
spec:
  replicas: 1
  selector:
    matchLabels:
      app: wio-k8s
  template:
    metadata:
      labels:
        app: wio-k8s
    spec:
      containers:
      - name: wio-k8s
        image: us-central1-docker.pkg.dev/GOOGLE_CLOUD_PROJECT/my-repository/wio-docker:COMMIT_SHA
        ports:
        - containerPort: 8080
---
kind: Service
apiVersion: v1
metadata:
  name: wio-k8s
spec:
  selector:
    app: wio-k8s
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  type: LoadBalancer

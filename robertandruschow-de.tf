resource "kubectl_manifest" "deployment" {
  yaml_body = <<YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  namespace: default
  name: andruschow-deployment
spec:
  selector:
    matchLabels:
      app: andruschow
  replicas: 1 # tells deployment to run 2 pods matching the template
  template:
    metadata:
      labels:
        app: andruschow
    spec:
      containers:
      - name: andruschow
        image: gcr.io/single-brace-265016/andruschow:latest
        ports:
        - containerPort: 8080
YAML
}


resource "kubectl_manifest" "service" {
  yaml_body = <<YAML
apiVersion: v1
kind: Service
metadata:
  namespace: default
  name: andruschow-service
  annotations:
#    cloud.google.com/neg: '{"ingress": true}'
spec:
  type: NodePort
  selector:
    app: andruschow
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
YAML
}

resource "google_compute_address" "static_ip" {
  name = "k8s-robertandruschow-de-address"
}

resource "kubectl_manifest" "certificate" {
  yaml_body = <<YAML
apiVersion: networking.gke.io/v1beta1
kind: ManagedCertificate
metadata:
  name: k8s-robertandruschow-de-certificate
spec:
  domains:
    - k8s.robertandruschow.de
YAML
}

resource "kubectl_manifest" "ingress" {
  yaml_body = <<YAML
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: andruschow-ingress
  namespace: default
spec:
  backend:
    serviceName: andruschow-service
    servicePort: 80
  rules:
  - host: k8s.robertandruschow.de
    http:
      paths:
      - path: /
        backend:
          serviceName: andruschow-service
          servicePort: 80
YAML
}
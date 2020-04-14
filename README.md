# gcp-infra
GCP infra for robert's kubernetes cluster in terraform.

## terraform state files
The .state files are stored in a secured bucket defined in `terraform-storage-bucket.tf`

## Kubernetes manifests 
The kubernetes manifests can be found in `k8s-manifests/`.
The resulting terraform resources need to be generated using `./scripts/generate_kubectl_manifests.sh` to generate `kubectl-resources.tf` .
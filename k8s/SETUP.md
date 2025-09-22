# Kubernetes (EKS) Setup

## Prerequisites
- AWS account and CLI configured
- Terraform installed
- kubectl installed

## Steps
1. Use Terraform to provision EKS and namespaces:
   ```sh
   cd terraform
   terraform init
   terraform apply
   ```
2. Update kubeconfig:
   ```sh
   aws eks update-kubeconfig --name microservices-eks --region us-west-2
   ```
3. Apply manifests for each environment:
   ```sh
   kubectl apply -f k8s/dev/
   kubectl apply -f k8s/qa/
   kubectl apply -f k8s/prod/
   ```

## References
- [EKS Docs](https://docs.aws.amazon.com/eks/)
- [Kubernetes Docs](https://kubernetes.io/docs/)

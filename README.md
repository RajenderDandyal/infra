# Java Microservices CI/CD Infrastructure

This repository provides a complete CI/CD setup for Java microservices using:
- **Terraform** for AWS EKS and JFrog infrastructure
- **Jenkins Multibranch Pipeline** for build, test, and deploy
- **Argo Rollouts** for progressive delivery
- **Kubernetes EKS Namespaces** for dev, staging, and prod
- **GitHub Actions** for pipeline triggers on push/merge
- **JFrog Artifactory** for storing Docker images
- **Dockerized Jenkins Agents** for scalable builds

## Structure
- `terraform/` — Infrastructure as code for EKS, namespaces, JFrog
- `jenkins/` — Jenkinsfile for multibranch pipeline
- `argo/` — Argo Rollouts configuration
- `k8s/` — Kubernetes manifests per environment
- `.github/workflows/` — GitHub Actions pipeline
- `jfrog/` — JFrog configuration

## Getting Started
1. Configure AWS credentials and Terraform variables.
2. Set up JFrog Artifactory and update URLs in pipeline files.
3. Configure Jenkins with required credentials and Docker agents.
4. Update Kubernetes manifests with your microservice details.
5. Push code to GitHub to trigger CI/CD pipeline.

## Notes
- Replace placeholder values (e.g., `<JFROG_URL>`, subnet IDs, VPC IDs) with your actual configuration.
- Ensure secrets are set in GitHub and Jenkins for JFrog and AWS access.
- Review each tool's documentation for advanced configuration.

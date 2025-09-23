# Java Microservices CI/CD Infrastructure

This repository provides a production-ready CI/CD and infrastructure setup for Java microservices and NX React monorepos, including:
- **Terraform** for AWS EKS, namespaces, JFrog, and Helm-based monitoring/logging
- **Helm** for deploying Prometheus, Grafana, Elasticsearch, Kibana, and Filebeat
- **Jenkins Multibranch Pipeline** for build, test, quality, and deployment
- **Argo Rollouts** for progressive delivery
- **Kubernetes EKS Namespaces** for dev, qa, prod
- **JFrog Artifactory** for storing Docker images
- **Dockerized Jenkins Agents** for scalable builds
- **SonarQube** for code quality analysis

## Structure
- `terraform/` — Infrastructure as code for EKS, namespaces, JFrog, Helm releases
- `jenkins/` — Jenkinsfiles for Java and NX React pipelines, SonarQube setup
- `argo/` — Argo Rollouts configuration for microservices and NX React
- `k8s/` — Kubernetes manifests per environment and app
- `jfrog/` — JFrog configuration and setup
- `monitoring/` — Prometheus and Grafana Helm values and setup
- `logging/` — ELK stack Helm values and setup

## Getting Started
1. Configure AWS credentials and Terraform variables.
2. Set up JFrog Artifactory and update URLs in pipeline files and manifests.
3. Configure Jenkins with required credentials and Docker agents.
4. Update Kubernetes manifests with your microservice and NX React details.
5. Use Terraform to provision infrastructure and deploy monitoring/logging with Helm.
6. Push code to GitHub to trigger Jenkins CI/CD pipeline.

## Notes
- Replace placeholder values (e.g., `<JFROG_URL>`, subnet IDs, VPC IDs) with your actual configuration.
- Ensure secrets are set in Jenkins for JFrog, SonarQube, and AWS access.
- Review each tool's documentation for advanced configuration.

# Terraform configuration for EKS and JFrog
provider "aws" {
  region = "us-west-2"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "microservices-eks"
  cluster_version = "1.27"
  subnets         = ["subnet-xxxx", "subnet-yyyy"] # Replace with actual subnet IDs
  vpc_id          = "vpc-xxxx" # Replace with actual VPC ID
  # ...other config...
}

resource "kubernetes_namespace" "dev" {
  metadata {
    name = "dev"
  }
}
resource "kubernetes_namespace" "qa" {
  metadata {
    name = "qa"
  }
}
resource "kubernetes_namespace" "prod" {
  metadata {
    name = "prod"
  }
}

# JFrog Artifactory example
resource "artifactory_local_docker_repository" "docker_repo" {
  key = "microservices-docker"
}

output "k8s_namespace_dev" {
  value = kubernetes_namespace.dev.metadata[0].name
}
output "k8s_namespace_qa" {
  value = kubernetes_namespace.qa.metadata[0].name
}
output "k8s_namespace_prod" {
  value = kubernetes_namespace.prod.metadata[0].name
}

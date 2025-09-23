# Terraform configuration for EKS and JFrog
provider "aws" {
  region = "us-west-2"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
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

resource "artifactory_local_docker_repository" "nx_react_repo" {
  key = "nx-react"
}

# Prometheus Helm release
resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace  = "monitoring"
  create_namespace = true
  values     = [file("../monitoring/prometheus-values.yaml")]
}

# Grafana Helm release
resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = "monitoring"
  values     = [file("../monitoring/grafana-values.yaml")]
}

# Elasticsearch Helm release
resource "helm_release" "elasticsearch" {
  name       = "elasticsearch"
  repository = "https://helm.elastic.co"
  chart      = "elasticsearch"
  namespace  = "logging"
  create_namespace = true
  values     = [file("../logging/elasticsearch-values.yaml")]
}

# Kibana Helm release
resource "helm_release" "kibana" {
  name       = "kibana"
  repository = "https://helm.elastic.co"
  chart      = "kibana"
  namespace  = "logging"
  values     = [file("../logging/kibana-values.yaml")]
}

# Filebeat Helm release
resource "helm_release" "filebeat" {
  name       = "filebeat"
  repository = "https://helm.elastic.co"
  chart      = "filebeat"
  namespace  = "logging"
  values     = [file("../logging/filebeat-values.yaml")]
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

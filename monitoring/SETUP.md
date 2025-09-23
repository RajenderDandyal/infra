# Monitoring Setup (Prometheus & Grafana)

## Prerequisites
- Kubernetes cluster (EKS)
- Helm installed

## Steps

### Automated Deployment (Recommended)
Use Terraform to deploy Prometheus and Grafana via Helm:
```sh
cd terraform
terraform apply
```
This will use the values in `monitoring/prometheus-values.yaml` and `monitoring/grafana-values.yaml`.

### Manual Deployment (Optional)
Add Helm repos:
```sh
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```
Install Prometheus:
```sh
helm install prometheus prometheus-community/prometheus --namespace monitoring --create-namespace -f prometheus-values.yaml
```
Install Grafana:
```sh
helm install grafana grafana/grafana --namespace monitoring -f grafana-values.yaml
```
Get Grafana admin password:
```sh
kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```
Port-forward Grafana UI:
```sh
kubectl port-forward --namespace monitoring svc/grafana 3000:3000
```
Add Prometheus as a data source in Grafana.

## References
- [Prometheus Helm Chart](https://github.com/prometheus-community/helm-charts)
- [Grafana Helm Chart](https://github.com/grafana/helm-charts)

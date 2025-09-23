# Monitoring Setup (Prometheus & Grafana)

## Prerequisites
- Kubernetes cluster (EKS)
- Helm installed

## Steps
1. Add Helm repos:
   ```sh
   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm repo add grafana https://grafana.github.io/helm-charts
   helm repo update
   ```
2. Install Prometheus:
   ```sh
   helm install prometheus prometheus-community/prometheus --namespace monitoring --create-namespace
   ```
3. Install Grafana:
   ```sh
   helm install grafana grafana/grafana --namespace monitoring
   ```
4. Get Grafana admin password:
   ```sh
   kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
   ```
5. Port-forward Grafana UI:
   ```sh
   kubectl port-forward --namespace monitoring svc/grafana 3000:3000
   ```
6. Add Prometheus as a data source in Grafana.

## References
- [Prometheus Helm Chart](https://github.com/prometheus-community/helm-charts)
- [Grafana Helm Chart](https://github.com/grafana/helm-charts)

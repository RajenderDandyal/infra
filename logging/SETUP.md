# Logging Setup (ELK Stack)

## Prerequisites
- Kubernetes cluster (EKS)
- Helm installed

## Steps

### Automated Deployment (Recommended)
Use Terraform to deploy Elasticsearch, Kibana, and Filebeat via Helm:
```sh
cd terraform
terraform apply
```
This will use the values in `logging/elasticsearch-values.yaml`, `logging/kibana-values.yaml`, and `logging/filebeat-values.yaml`.

### Manual Deployment (Optional)
Add Helm repo:
```sh
helm repo add elastic https://helm.elastic.co
helm repo update
```
Install Elasticsearch:
```sh
helm install elasticsearch elastic/elasticsearch --namespace logging --create-namespace -f elasticsearch-values.yaml
```
Install Kibana:
```sh
helm install kibana elastic/kibana --namespace logging -f kibana-values.yaml
```
Install Filebeat for log shipping:
```sh
helm install filebeat elastic/filebeat --namespace logging -f filebeat-values.yaml
```
Port-forward Kibana UI:
```sh
kubectl port-forward --namespace logging svc/kibana-kibana 5601:5601
```

## References
- [Elastic Helm Charts](https://github.com/elastic/helm-charts)

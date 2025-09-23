# Logging Setup (ELK Stack)

## Prerequisites
- Kubernetes cluster (EKS)
- Helm installed

## Steps
1. Add Helm repo:
   ```sh
   helm repo add elastic https://helm.elastic.co
   helm repo update
   ```
2. Install Elasticsearch:
   ```sh
   helm install elasticsearch elastic/elasticsearch --namespace logging --create-namespace
   ```
3. Install Kibana:
   ```sh
   helm install kibana elastic/kibana --namespace logging
   ```
4. (Optional) Install Filebeat for log shipping:
   ```sh
   helm install filebeat elastic/filebeat --namespace logging
   ```
5. Port-forward Kibana UI:
   ```sh
   kubectl port-forward --namespace logging svc/kibana-kibana 5601:5601
   ```

## References
- [Elastic Helm Charts](https://github.com/elastic/helm-charts)

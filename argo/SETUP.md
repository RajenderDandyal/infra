# Argo Rollouts Setup

## Prerequisites
- Kubernetes cluster (EKS recommended)
- `kubectl` and `argo` CLI installed

## Steps
1. Install Argo Rollouts in your cluster:
   ```sh
   kubectl create namespace argo-rollouts
   kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml
   ```
2. Apply your rollout manifest:
   ```sh
   kubectl apply -f argo/rollout.yaml -n <env>
   ```
3. Monitor rollouts:
   ```sh
   kubectl argo rollouts get rollout microservice-rollout -n <env>
   ```

## References
- [Argo Rollouts Docs](https://argoproj.github.io/argo-rollouts/)

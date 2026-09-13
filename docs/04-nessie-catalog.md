# Step 4: Deploy Nessie Catalog

Nessie provides the Iceberg REST catalog. Its metadata uses a persistent `1Gi` RocksDB PVC.

```bash
helm repo add nessie https://charts.projectnessie.org
helm repo update
helm upgrade --install nessie nessie/nessie \
  --version 0.108.8 \
  --namespace lakehouse-platform \
  --values helm/nessie-values.yaml
```

Verify:

```bash
kubectl get pod,pvc,service -n lakehouse-platform
kubectl rollout status deployment/nessie -n lakehouse-platform
```

Nessie must run as one replica with RocksDB because the PVC is single-writer (`ReadWriteOnce`).

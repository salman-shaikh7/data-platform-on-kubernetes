# Step 2: Deploy MinIO

Manifest: `kubernetes/lakehouse/minio.yaml`

It creates a MinIO StatefulSet, a `3Gi` `local-path` PVC, a Secret for credentials, and a ClusterIP service.

```bash
kubectl apply --dry-run=client -f kubernetes/lakehouse/minio.yaml
kubectl apply -f kubernetes/lakehouse/minio.yaml
kubectl get pvc,pod,service -n lakehouse-platform
```

Expected: PVC `Bound`, pod `1/1 Running`, service ports `9000` and `9001`.

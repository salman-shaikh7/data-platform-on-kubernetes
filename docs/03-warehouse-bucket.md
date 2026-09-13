# Step 3: Create the Iceberg Warehouse Bucket

Manifest: `kubernetes/lakehouse/create-warehouse-bucket.yaml`

```bash
kubectl apply --dry-run=client -f kubernetes/lakehouse/create-warehouse-bucket.yaml
kubectl apply -f kubernetes/lakehouse/create-warehouse-bucket.yaml
kubectl logs job/create-iceberg-warehouse -n lakehouse-platform
```

The Job creates the `iceberg-warehouse` bucket in MinIO. It is safe for the Job to finish with `Complete`.

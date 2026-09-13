# Step 1: Lakehouse Namespace

```bash
kubectl create namespace lakehouse-platform
kubectl get namespace lakehouse-platform
```

The namespace isolates MinIO and Nessie from Airflow, monitoring, compute, and replication workloads.

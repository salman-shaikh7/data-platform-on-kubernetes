# Step 7: Remove Temporary Test Resources

The PyIceberg test pod is disposable:

```bash
kubectl delete pod pyiceberg-test -n lakehouse-platform
```

Do not delete the MinIO or Nessie PVCs; they contain the lakehouse data and catalog metadata.

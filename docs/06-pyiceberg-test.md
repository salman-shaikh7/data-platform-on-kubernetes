# Step 6: Test Iceberg with PyIceberg

The temporary pod `kubernetes/lakehouse/pyiceberg-test-pod.yaml` ran PyIceberg inside Kubernetes so cluster DNS could resolve MinIO and Nessie.

The test:

1. Connected to Nessie.
2. Created `demo.events`.
3. Appended three rows using PyArrow.
4. Read the rows back from MinIO.

Result:

```text
id  message
1   hello
2   iceberg
3   nessie
```

The table data is in MinIO; Nessie stores the catalog and snapshot metadata.

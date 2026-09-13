# Step 5: Test the Nessie REST Catalog

Port-forward Nessie for a local test:

```bash
kubectl port-forward -n lakehouse-platform service/nessie 19120:19120
```

Check the Iceberg REST API:

```bash
curl -i http://localhost:19120/iceberg/v1/config
```

Create and list a namespace:

```bash
curl -i -X POST http://localhost:19120/iceberg/v1/main%7Clakehouse/namespaces \
  -H 'Content-Type: application/json' \
  -d '{"namespace":["demo"]}'

curl -s http://localhost:19120/iceberg/v1/main%7Clakehouse/namespaces
```

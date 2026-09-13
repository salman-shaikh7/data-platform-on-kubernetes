# Data Platform on Kubernetes

A learning project for building a modular data platform on Kubernetes.

## Planned platforms

- Iceberg-based storage and table layer
- Spark compute platform
- Kafka-based replication and CDC platform
- Shared object storage and catalog services
- Monitoring and operational documentation

## Architecture direction

```text
Transactional Database -> CDC -> Kafka -> Iceberg
                                      ^
                                      |
                               Spark / Query Engines
```

The platforms will be deployed and tested separately because this local Kubernetes cluster has limited capacity. Shared Iceberg storage will remain available while Spark or Kafka is tested.

## Current status

The initial lakehouse foundation is working:

- MinIO provides persistent S3-compatible storage.
- Nessie provides the Iceberg REST catalog with persistent RocksDB metadata.
- PyIceberg successfully created, wrote, and read the `demo.events` table.

Spark and Kafka are intentionally not deployed yet because this local cluster has limited capacity.

## Initial implementation plan

We will begin with the Iceberg and compute platform:

1. Deploy MinIO or another object-storage layer.
2. Deploy an Iceberg catalog.
3. Deploy a small Spark environment.
4. Run a basic table read/write test.
5. Measure cluster resource usage.

Kafka and CDC replication will be added only after the compute baseline is working. If capacity is insufficient, Kafka will be tested separately by scaling down the compute platform first.

## Documentation

The numbered build notes are in [`docs/`](docs/00_plan_v1.md):

1. [Build plan](docs/00_plan_v1.md)
2. [Lakehouse namespace](docs/01-lakehouse-namespace.md)
3. [MinIO storage](docs/02-minio-storage.md)
4. [Warehouse bucket](docs/03-warehouse-bucket.md)
5. [Nessie catalog](docs/04-nessie-catalog.md)
6. [Catalog API test](docs/05-catalog-api-test.md)
7. [PyIceberg test](docs/06-pyiceberg-test.md)
8. [Test cleanup](docs/07-test-cleanup.md)
9. [Technical debt](docs/08-technical-debt.md)

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

## Status

Initial repository setup. Implementation and documentation will be added incrementally.

## Initial implementation plan

We will begin with the Iceberg and compute platform:

1. Deploy MinIO or another object-storage layer.
2. Deploy an Iceberg catalog.
3. Deploy a small Spark environment.
4. Run a basic table read/write test.
5. Measure cluster resource usage.

Kafka and CDC replication will be added only after this baseline is working. If the cluster does not have enough capacity, Kafka will be tested separately by scaling down the compute platform first.

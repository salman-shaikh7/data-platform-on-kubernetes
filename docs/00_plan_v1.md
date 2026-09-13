# Data Platform Build Plan

## Initial sequence

1. Build the lakehouse storage and catalog foundation.
2. Validate Iceberg with PyIceberg.
3. Add a lightweight Spark compute platform.
4. Measure resource usage and validate Spark reads and writes.
5. Add Kafka and CDC replication separately if cluster capacity allows.

## Platform ownership

- `lakehouse-platform`: MinIO and Nessie
- `compute-platform`: Spark and query engines
- `replication-platform`: Kafka, Debezium, and connectors

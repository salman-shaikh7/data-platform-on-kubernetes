# Lakehouse Technical Debt

Items intentionally deferred while building the initial local lakehouse platform.

## Short-lived object-storage credentials

Current state: Nessie and clients use static MinIO credentials.

Future improvement: configure MinIO STS/IAM roles and Nessie vended credentials so clients receive short-lived credentials for S3 access.

Why it matters:

- Limits the impact of leaked credentials.
- Avoids long-lived secrets in Python, Spark, or replication workloads.
- Better matches production identity and access practices.

Required work:

- Configure MinIO STS and IAM policies.
- Configure Nessie credential vending.
- Enable HTTPS and secure service exposure.
- Test credential expiry and renewal from PyIceberg and Spark.

## Other future hardening

- Replace local-path storage with replicated production storage.
- Add authentication and authorization for Nessie.
- Back up Nessie catalog metadata and MinIO data.
- Add TLS for internal and external service communication.

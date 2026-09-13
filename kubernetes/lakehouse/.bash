kubectl exec -i pyiceberg-test -n lakehouse-platform -- python - <<'PY'
import pyarrow as pa
from pyiceberg.catalog import load_catalog

catalog = load_catalog(
    "nessie",
    **{
        "type": "rest",
        "uri": "http://nessie:19120/iceberg",
        "warehouse": "s3://iceberg-warehouse",
        "s3.endpoint": "http://minio:9000",
        "s3.access-key-id": "lakeadmin",
        "s3.secret-access-key": "Pass@12345",
        "s3.path-style-access": "true",
        "s3.region": "us-east-1",
    },
)

schema = pa.schema([
    pa.field("id", pa.int32(), nullable=False),
    pa.field("message", pa.string(), nullable=False),
])

table = catalog.create_table_if_not_exists(
    "demo.events",
    schema=schema,
)

data = pa.Table.from_pydict(
    {
        "id": [1, 2, 3],
        "message": ["hello", "iceberg", "nessie"],
    },
    schema=schema,
)

table.append(data)

print(table.scan().to_arrow())
PY
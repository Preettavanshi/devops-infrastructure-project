#!/bin/bash

set -e

DB_INSTANCE="octabyte-db"
SNAPSHOT_LABEL="manual-backup-$(date +%F-%H-%M-%S)"

echo "📦 Starting snapshot for RDS instance '$DB_INSTANCE'..."
aws rds create-db-snapshot \
    --db-instance-identifier "$DB_INSTANCE" \
    --db-snapshot-identifier "$SNAPSHOT_LABEL"

echo "✅ Snapshot '$SNAPSHOT_LABEL' initiated. Monitor status in AWS Console."


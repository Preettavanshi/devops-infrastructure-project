#!/bin/bash

# Set variables
DB_INSTANCE_IDENTIFIER="your-db-identifier"
BACKUP_NAME="manual-backup-$(date +%F-%H-%M-%S)"

echo "Starting RDS manual snapshot: $BACKUP_NAME"

aws rds create-db-snapshot \
    --db-instance-identifier "$DB_INSTANCE_IDENTIFIER" \
    --db-snapshot-identifier "$BACKUP_NAME"

echo "Backup initiated. Check AWS RDS console for progress."

#!/bin/bash

set -e

echo "⚠️  WARNING: This will destroy all Terraform-managed infrastructure!"
read -p "Are you sure you want to continue? (yes/no): " CONFIRM

if [[ "$CONFIRM" == "yes" ]]; then
  cd "$(dirname "$0")/../terraform"
  echo "⛏️ Destroying resources from Terraform directory: $(pwd)"
  terraform destroy -auto-approve

  echo "🧹 Optional: Cleaning up Docker resources..."
  docker ps -q | xargs -r docker stop
  docker ps -a -q | xargs -r docker rm
  docker images -q | xargs -r docker rmi

  echo "✅ Cleanup and teardown complete."
else
  echo "❌ Cleanup canceled by user."
fi

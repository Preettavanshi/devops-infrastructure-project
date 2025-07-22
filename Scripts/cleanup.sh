#!/bin/bash

echo "Destroying all Terraform-managed infrastructure. This is irreversible. Continue? (y/n)"
read CONTINUE

if [ "$CONTINUE" == "y" ]; then
    cd terraform
    terraform destroy -auto-approve
else
    echo "Canceled."
fi

echo "Optional: Stopping and removing all Docker containers..."
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

echo "Cleanup complete."

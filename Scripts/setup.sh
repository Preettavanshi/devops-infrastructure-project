#!/bin/bash

# Install necessary tools (Terraform, AWS CLI, Docker)
echo "Installing Terraform, AWS CLI, and Docker..."

# For Ubuntu/Debian, as an example
sudo apt-get update -y
sudo apt-get install -y unzip curl

# Install Terraform
curl -fsSL https://releases.hashicorp.com/terraform/1.6.6/terraform_1.6.6_linux_amd64.zip -o terraform.zip
unzip terraform.zip
sudo mv terraform /usr/local/bin/
rm terraform.zip

# Install AWS CLI (v2)
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws/

# Install Docker
sudo apt-get install -y docker.io

# Initialize Terraform
cd terraform
terraform init

echo "Setup complete. Please configure your AWS credentials if not already set."

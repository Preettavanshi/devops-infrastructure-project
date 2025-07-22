#!/bin/bash

set -e  # exit on error

echo "🔧 Starting setup of local DevOps environment..."

# --- Install Terraform ---
if ! command -v terraform &> /dev/null; then
  echo "📦 Installing Terraform..."
  curl -fsSL https://releases.hashicorp.com/terraform/1.6.6/terraform_1.6.6_linux_amd64.zip -o terraform.zip
  unzip terraform.zip
  sudo mv terraform /usr/local/bin/
  rm terraform.zip
else
  echo "✅ Terraform is already installed"
fi

# --- Install AWS CLI ---
if ! command -v aws &> /dev/null; then
  echo "📦 Installing AWS CLI..."
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  rm -rf awscliv2.zip aws/
else
  echo "✅ AWS CLI is already installed"
fi

# --- Install Docker ---
if ! command -v docker &> /dev/null; then
  echo "📦 Installing Docker..."
  sudo apt-get update
  sudo apt-get install -y docker.io
else
  echo "✅ Docker is already installed"
fi

# --- Terraform Initialization ---
cd "$(dirname "$0")/../terraform"
echo "📂 Switching to Terraform directory: $(pwd)"
terraform init

echo "✅ Setup complete! You're ready to deploy infrastructure."


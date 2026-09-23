#!/bin/bash

set -e pipefail

echo "Setting up the Kubernetes cluster using Kind"
terraform init
terraform apply -auto-approve
echo "Kubernetes cluster setup completed successfully."

./install-ingress-nginx.sh

#!/bin/bash

set -eou pipefail

echo "----Deploying resources to kind cluster"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
K8S_DIR="$SCRIPT_DIR/../k8s"

kubectl apply -f "$K8S_DIR/frontend-deployment.yml"
kubectl apply -f "$K8S_DIR/frontend-service.yml"
kubectl apply -f "$K8S_DIR/gateway.yml"
kubectl apply -f "$K8S_DIR/routes.yml"

echo "-----Resources deployed successfully to kind cluster-----"

sleep 3
docker images
kubectl get all

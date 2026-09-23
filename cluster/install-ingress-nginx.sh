#!/bin/bash

set -e pipefail

echo "Installing ingress-nginx controller"

kubectl apply \
  -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

echo "Waiting for ingress-nginx controller to be ready"

kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=120s

  echo "Ingress-nginx controller installed successfully"

  kubectl get pods --namespace ingress-nginx -o wide
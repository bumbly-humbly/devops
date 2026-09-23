#!/bin/bash

set -eou pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIND_CONFIG_DIR="$SCRIPT_DIR/kind-cluster-config.yml"

echo "Creating kind cluster"
kind create cluster --name demo-cluster --config "$KIND_CONFIG_DIR"
echo "Kind cluster created successfully"
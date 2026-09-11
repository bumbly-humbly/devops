#!/bin/bash

set -eou pipefail

echo "Starting frontend service..."

docker build -t ghcr.io/bumbly-humbly/frontend:latest ./frontend
docker push ghcr.io/bumbly-humbly/frontend:latest

echo "Frontend docker image built successfully."
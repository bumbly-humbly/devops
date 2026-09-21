#!/bin/bash

set -eou pipefail

echo "Building frontend docker image..."

docker build -t ghcr.io/bumbly-humbly/frontend:v1.0.0 .
docker push ghcr.io/bumbly-humbly/frontend:v1.0.0

echo "Frontend docker image built successfully."
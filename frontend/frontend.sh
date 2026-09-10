#!/bin/bash

set -eou pipefail

echo "Starting frontend service..."

docker build -t frontend:latest .
docker run -d -p 8080:80 --name frontend frontend:latest

echo "Frontend service is running on http://localhost:8080"
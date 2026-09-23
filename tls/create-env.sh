#!/bin/bash

set -e pipefail

echo "Creating environment variables for TLS certificate and private key"

export TF_VAR_tls_certificate="$(cat frontend.example.com.crt)"
export TF_VAR_tls_private_key="$(cat frontend.example.com.key)"

echo "Environment variables created successfully."
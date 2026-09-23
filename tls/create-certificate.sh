#!/bin/bash

set -e pip

echo creating self-signed certificate for frontend.example.com

openssl req -x509 -nodes -newkey rsa:2048 \
  -keyout frontend.example.com.key \
  -out frontend.example.com.crt \
  -days 365 \
  -subj "/CN=frontend.example.com" \
  -addext "subjectAltName=DNS:frontend.example.com"

echo "Certificate created successfully."
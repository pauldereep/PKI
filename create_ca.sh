#!/bin/bash

BASE_DIR="./pki"
PRIVATE_DIR="$BASE_DIR/private"
CA_DIR="$BASE_DIR/ca"
CA_KEY="$PRIVATE_DIR/ca.key"
CA_CERT="$CA_DIR/ca.crt"

openssl genrsa -out $CA_KEY 4096
chmod 600 $CA_KEY

openssl req -x509 -new -nodes -key $CA_KEY -sha256 -days 3650 -out $CA_CERT \
    -subj "/C=FR/ST=Paris/L=Paris/O=MyPKI/OU=RootCA/CN=RootCA"

echo "CA certificate created at $CA_CERT"
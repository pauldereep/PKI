#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <service_name>"
    exit 1
fi

SERVICE_NAME=$1
BASE_DIR="./pki"
CERTS_DIR="$BASE_DIR/certs"
PRIVATE_DIR="$BASE_DIR/private"
NEW_CERTS_DIR="$BASE_DIR/newcerts"
CA_KEY="$PRIVATE_DIR/ca.key"
CA_CERT="$BASE_DIR/ca/ca.crt"

SERVICE_KEY="$PRIVATE_DIR/${SERVICE_NAME}.key"
SERVICE_CSR="$NEW_CERTS_DIR/${SERVICE_NAME}.csr"
SERVICE_CERT="$CERTS_DIR/${SERVICE_NAME}.crt"

openssl genrsa -out $SERVICE_KEY 2048
chmod 600 $SERVICE_KEY

openssl req -new -key $SERVICE_KEY -out $SERVICE_CSR \
    -subj "/C=FR/ST=Paris/L=Paris/O=MyPKI/OU=Services/CN=$SERVICE_NAME"

openssl x509 -req -in $SERVICE_CSR -CA $CA_CERT -CAkey $CA_KEY -CAcreateserial \
    -out $SERVICE_CERT -days 825 -sha256

echo "Certificate created for $SERVICE_NAME at $SERVICE_CERT"
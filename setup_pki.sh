#!/bin/bash

BASE_DIR="./pki"
CA_DIR="$BASE_DIR/ca"
CERTS_DIR="$BASE_DIR/certs"
PRIVATE_DIR="$BASE_DIR/private"
NEW_CERTS_DIR="$BASE_DIR/newcerts"
CRL_DIR="$BASE_DIR/crl"

CA_KEY="$PRIVATE_DIR/ca.key"
CA_CERT="$CA_DIR/ca.crt"
INDEX_FILE="$BASE_DIR/index.txt"
SERIAL_FILE="$BASE_DIR/serial"

mkdir -p $CA_DIR $CERTS_DIR $PRIVATE_DIR $NEW_CERTS_DIR $CRL_DIR
chmod 700 $PRIVATE_DIR

touch $INDEX_FILE
echo 1000 > $SERIAL_FILE

echo "PKI structure initialized in $BASE_DIR"
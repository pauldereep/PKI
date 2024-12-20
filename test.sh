#!/bin/bash

# Vérifie si les arguments nécessaires sont fournis
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <ca_cert> <cert> <key>"
    exit 1
fi

CA_CERT=$1
CERT=$2
KEY=$3

# Vérifications des détails du certificat
echo "Vérification des détails du certificat"
openssl x509 -in $CERT -text -noout

# Vériication de la chaîne de confiance
echo "Vérification de la chaîne de confiance..."
openssl verify -CAfile $CA_CERT $CERT

# Vérification de la correspondance entre la clé privée et le certificat
echo "Vérification de la correspondance entre la clé privée et le certificat..."
CERT_MODULUS=$(openssl x509 -noout -modulus -in $CERT | openssl md5)
KEY_MODULUS=$(openssl rsa -noout -modulus -in $KEY | openssl md5)

if [ "$CERT_MODULUS" == "$KEY_MODULUS" ]; then
    echo "La clé privée correspond au certificat."
else
    echo "La clé privée ne correspond pas au certificat."
fi

# Vérification des dates de validité
echo "Vérification des dates de validité..."
openssl x509 -in $CERT -noout -dates

echo "Vérification terminée."
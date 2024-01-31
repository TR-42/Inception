#!/bin/sh

cd $(dirname $0)

KEY_BITS=2048
CERT_DAYS=30

PRIVATE_KEY_FILE="./server.key"
CSR_FILE="./server.csr"
CERTIFICATE_FILE="./server.crt"

source ../../../../.env

echo "# Generating RSA private key"
if [ -f ${PRIVATE_KEY_FILE} ]; then
    echo "\t${PRIVATE_KEY_FILE} already exists -> skipping"
else
    openssl genrsa\
      -out ${PRIVATE_KEY_FILE}\
      ${KEY_BITS}
fi
echo

echo "# Generating Certificate Signing Request"
openssl req -new\
  -key ${PRIVATE_KEY_FILE}\
  -subj "/C=JP/ST=Tokyo/L=Tokyo/O=42 Tokyo/OU=Learner/CN=${DOMAIN_NAME}"\
  -out ${CSR_FILE}
echo

echo "# Generating self-signed certificate"
openssl x509\
  -days ${CERT_DAYS}\
  -req\
  -signkey ${PRIVATE_KEY_FILE}\
  -in ${CSR_FILE}\
  -out ${CERTIFICATE_FILE}

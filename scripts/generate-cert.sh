#!/bin/bash

mkdir -p certs
cd certs
openssl req -newkey rsa:4096 -nodes -sha256 -keyout domain.key -x509 -days 3650 -out domain.crt
update-ca-trust
echo Add these lines to install-config.yaml file...

cat domain.crt | sed "s:^: :g"


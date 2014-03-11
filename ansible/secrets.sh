#!/bin/bash
echo "Create server.key"
openssl genrsa -out /tmp/server.key 2048

echo 'Create secrets.yml file'
echo 'crowd_app_name: crowd' > /tmp/secrets.yml
echo 'crowd_app_password: crowdpw' >> /tmp/secrets.yml
echo 'db_password: corwdpw' >> /tmp/secrets.yml
echo 'openssl_certs: ' >> /tmp/secrets.yml
echo '    - /tmp/server.key' >> /tmp/secrets.yml

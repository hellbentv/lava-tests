#!/bin/bash
echo "Create server.key"
openssl genrsa -out /root/server.key 2048

echo 'Create secrets.yml file'
echo 'crowd_app_name: crowd' > /root/secrets.yml
echo 'crowd_app_password: crowdpw' >> /root/secrets.yml
echo 'db_password: corwdpw' >> /root/secrets.yml
echo 'openssl_certs: ' >> /root/secrets.yml
echo '    - /root/server.key' >> /root/secrets.yml

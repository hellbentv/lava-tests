#!/bin/bash
echo "Create server.key"
openssl genrsa -out /root/lava-server.pem 2048

echo 'Create secrets.yml file'
echo 'crowd_app_name: crowdname' > /root/secrets.yml
echo 'crowd_app_password: crowdpw' >> /root/secrets.yml
echo 'db_password: databaspw' >> /root/secrets.yml
echo 'openssl_certs: ' >> /root/secrets.yml
echo '    - /root/lava-server.pem' >> /root/secrets.yml

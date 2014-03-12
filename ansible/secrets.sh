#!/bin/bash
cd /root

echo "Create server.key & new lava-server.csr"
openssl req -new -x509 -newkey rsa:2048 -nodes -out lava-server.csr -keyout lava-server.key -days 365 \
    -subj "/C=US/ST=Arizona/L=Scottsdale/O=lavaserver.com/CN=lava-server"

echo "TODO: Do we need a task?"
cat lava-server.key lava-server.csr > lava-server.pem

echo 'Create secrets.yml file'
echo 'crowd_app_name: crowdname' > /root/secrets.yml
echo 'crowd_app_password: crowdpw' >> /root/secrets.yml
echo 'db_password: databaspw' >> /root/secrets.yml
echo 'openssl_certs: ' >> /root/secrets.yml
echo '    - /root/lava-server.pem' >> /root/secrets.yml
echo '    - /root/lava-server.key' >> /root/secrets.yml
echo '    - /root/lava-server.csr' >> /root/secrets.yml

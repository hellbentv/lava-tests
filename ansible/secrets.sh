#!/bin/bash
domain=lava-server

# Creates self figned certificate to use with a website.
function create_certs() {
    head /dev/urandom > /dev/null
    openssl genrsa -rand /dev/urandom -out ${1}.key 2048
    openssl req -new -x509 -days 3652 -key ${1}.key -out ${1}.pem \
        -subj "/C=US/ST=Colorado/L=Boulder/O=${1}.com/CN=${1}"
}
echo "Creating cert for domain '$domain'"
create_certs $domain

echo "Build secrets file, certs in $PWD"
cat > /root/secrets.yml <<EOL
crowd_app_name: crowdname
crowd_app_password: crowdpw
db_password: databaspw
openssl_certs: 
    - $PWD/${domain}.pem
    - $PWD/${domain}.key
EOL

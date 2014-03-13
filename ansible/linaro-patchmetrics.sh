#!/usr/bin/env bash
#
# linaro-patchmetrics Ansible deployment script for LAVA job submission
# Version v0.1.0
# More info: 
#
# Licensed under MIT: http://kvz.io/licenses/LICENSE-MIT
# Copyright (c) 2014 Linaro, LTD
# http://www.linaro.org
#
# Usage:
#  ./linaro-patchmetrics.sh domainname
#

### Configuration
#####################################################################

domain=$1
playbook=https://git.linaro.org/infrastructure/linaro-patchmetrics.git
workdir=ansible


### Functions
#####################################################################

function create_certs() {
    head /dev/urandom > /dev/null
    openssl genrsa -rand /dev/urandom -out ${1}.key 2048
    openssl req -new -x509 -days 3652 -key ${1}.key -out ${1}.pem \
        -subj "/C=US/ST=Colorado/L=Boulder/O=${1}.com/CN=${1}"
}

### Runtime
#####################################################################

# Download playbook into a persistent location
mkdir -p /opt; cd /opt
git clone ${playbook} ${workdir}
cd ${workdir}

#Create host_vars file for the domain
cat > host_vars/${domain} <<EOL
nickname: ${domain}
hostname: ${domain}
role: staging
patchwork_repos_path: /opt/patchwork
EOL

#Generate website certificates (self-signed)
create_certs $domain

#Create a secrets file so Ansible will install the secrets
cat > secrets.yml <<EOL
crowd_app_name: crowdname
crowd_app_password: crowdpw
db_password: databaspw
openssl_certs: 
    - $PWD/${domain}.pem
    - $PWD/${domain}.key
EOL


    

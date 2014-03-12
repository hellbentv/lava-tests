#!/bin/bash

echo "Create host_vars file"

cat > /root/host_vars.tmp <<EOL
nickname: $1
hostname: $1
role: staging
patchwork_repos_path: /opt/patchwork
EOL

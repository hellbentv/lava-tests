#!/bin/bash

echo "Create host_vars file"
echo 'nickname: patches' > /root/localhost
echo 'hostname: lava-server' >> /root/localhost
echo 'role: staging' >> /root/localhost
echo 'patchwork_repos_path: /opt/patchwork' >> /root/localhost

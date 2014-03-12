#!/bin/bash

echo "Create update hostname"
hostname localhost
echo localhost > /etc/hostname

echo "Create host_vars file"
echo 'nickname: patches' > /root/localhost
echo 'hostname: hostname' >> /root/localhost
echo 'role: staging' >> /root/localhost
echo 'patchwork_repos_path: /opt/patchwork' >> /root/localhost

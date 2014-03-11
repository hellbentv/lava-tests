#!/bin/bash
echo "Create host_vars file"
echo 'nickname: patches' > /root/localhost
echo 'hostname: localhost' >> /root/localhost
echo 'role: production' >> /root/localhost
echo 'patchwork_repos_path: /opt/patchwork' >> /root/localhost

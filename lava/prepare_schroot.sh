apt-get -y install schroot

mkdir -p /srv/lava/schroot
wget http://homecloud/images/schroot/debian_wheezy.tgz -O /srv/lava/schroot/debian_wheezy.tgz

cat > /etc/schroot/schroot.conf <<EOL
[default]
description=Simple Debian Wheezy Schroot
aliases=test
type=file
file=/srv/lava/schroot/debian_wheezy.tgz
users=lava
root-groups=root
script-config=desktop/config
personality=linux
preserve-environment=true
EOL

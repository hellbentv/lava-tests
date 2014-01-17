
apt-get -y install schroot

wget homecloud/images/schroot/debian_wheezy.tgz -o /srv/lava/debian_wheezy.tgz

mkdir /srv/lava/schroot
cd /srv/lava/schroot
tar xvzf /srv/lava/debian_wheezy.tgz

cat >> /etc/schroot/schroot.conf <<EOL
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

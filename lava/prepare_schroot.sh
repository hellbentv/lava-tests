# Dependency: apt-get -y install schroot


# Dependency: apt-get -y install debootstrap
# create a debian wheezy schroot
mkdir -p /srv/lava/schroot/debian_wheezy
cd /srv/lava/schroot/debian_wheezy
debootstrap wheezy .
# create a debian wheezy schroot
tar cvzf ../debian_wheezy.tgz .

# Create a Schroot Config
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

#!/bin/bash
apt-get -y install binfmt-support qemu schroot

cat > /usr/share/binfmts/qemu-aarch64 <<EOL
package qemu-user-static
interpreter /usr/bin/qemu-aarch64
flags: OC
offset 0
magic \x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7
mask \xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff
EOL
update-binfmts --import qemu-aarch64

groupadd user
useradd -g user user

cat > /etc/schroot/chroot.d/schroot-aarch64.conf <<EOL
[aarch64]
description=arm64 chroot
file=/root/debian-unstable-arm64.tar.gz
type=file
users=user
groups=user,sbuild
root-groups=user,sbuild
EOL

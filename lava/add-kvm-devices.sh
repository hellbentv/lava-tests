# Params
#    $1 - lava instance name
#    $2 - kvm device_type
#    $3 - number of devices
for i in (1..$2); do
mkdir -p /srv/lava/instances/$1/etc/lava-dispatcher/devices
cat > /srv/lava/instances/$1/etc/lava-dispatcher/devices/$2-$i.conf <<EOL
device_type = $2 
root_part = 1 
EOL
done


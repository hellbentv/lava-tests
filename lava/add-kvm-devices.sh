# Params
#    $1 - lava instance name
#    $2 - kvm device_type
#    $3 - number of devices
LAVA_INSTANCE=$1
devicetype=$2
devicecount=$3
for i in $(seq 1 $devicecount); do
mkdir -p /srv/lava/instances/$LAVA_INSTANCE/etc/lava-dispatcher/devices
cat > /srv/lava/instances/$LAVA_INSTANCE/etc/lava-dispatcher/devices/$devicetype-$i.conf <<EOL
device_type = $devicetype
root_part = 1 
EOL
done
#show files
head -n 1000 /srv/lava/instances/$LAVA_INSTANCE/etc/lava-dispatcher/devices/$devicetype-*

# Params
#    $1 - lava instance name
#    $2 - kvm device_type
#    $3 - number of devices
LAVA_INSTANCE=$1
ADMINUSER=$2
ADMINPASS=$3
devicetype=$4
devicecount=$5
for i in $(seq 1 $devicecount); do
mkdir -p /srv/lava/instances/$LAVA_INSTANCE/etc/lava-dispatcher/devices
cat > /srv/lava/instances/$LAVA_INSTANCE/etc/lava-dispatcher/devices/$devicetype-$i.conf <<EOL
device_type = $devicetype
root_part = 1 
EOL
./lava/add-dashboard-devices.sh $ADMINUSER $ADMINPASS $devicetype $devicetype-$i
done
#show files
head -n 1000 /srv/lava/instances/$LAVA_INSTANCE/etc/lava-dispatcher/devices/$devicetype-*

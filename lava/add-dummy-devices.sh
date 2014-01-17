# Params
#    $1 - lava instance name
#    $2 - dummy driver {schroot|host}
#    $3 - number of devices
LAVA_INSTANCE=$1
ADMINUSER=$2
ADMINPASS=$3
driver=$4
numdevices=$5

#add a new dummy-devicetype.conf file
mkdir -p /srv/lava/instances/$LAVA_INSTANCE/etc/lava-dispatcher/device-types
cat > /srv/lava/instances/$LAVA_INSTANCE/etc/lava-dispatcher/device-types/dummy-$driver.conf <<EOL
#/srv/lava/instances/$LAVA_INSTANCE/etc/lava-dispatcher/device-types/dummy-$driver.conf
client_type = dummy
dummy_driver = $driver
EOL
#show files
head -n 1000 /srv/lava/instances/$LAVA_INSTANCE/etc/lava-dispatcher/device-types/dummy-$driver.conf


# Create N dummy-devicetype-driver-$i devices
for i in $(seq 1 $numdevices); do
mkdir -p /srv/lava/instances/$LAVA_INSTANCE/etc/lava-dispatcher/devices
cat > /srv/lava/instances/$LAVA_INSTANCE/etc/lava-dispatcher/devices/dummy-$driver-$i.conf <<EOL
#/srv/lava/instances/$LAVA_INSTANCE/etc/lava-dispatcher/devices/dummy-$driver-$i.conf
device_type = dummy-$driver
EOL
./lava/add-dashboard-devices.sh $ADMINUSER $ADMINPASS dummy-$driver dummy-$driver-$i

./lava/test-job.sh dummy-$driver-$i 10
done
#show files
head -n 1000 /srv/lava/instances/$LAVA_INSTANCE/etc/lava-dispatcher/devices/dummy-$driver-*


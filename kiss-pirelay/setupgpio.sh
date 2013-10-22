echo 4 > /sys/class/gpio/export
echo 17 > /sys/class/gpio/export
echo 21 > /sys/class/gpio/export
echo 22 > /sys/class/gpio/export
echo 18 > /sys/class/gpio/export
echo 23 > /sys/class/gpio/export
echo 24 > /sys/class/gpio/export
echo 25 > /sys/class/gpio/export
test -f relay01 || ln -s /sys/class/gpio/gpio4 relay01
test -f relay02 || ln -s /sys/class/gpio/gpio17 relay02
test -f relay03 || ln -s /sys/class/gpio/gpio21 relay03
test -f relay04 || ln -s /sys/class/gpio/gpio22 relay04
test -f relay05 || ln -s /sys/class/gpio/gpio18 relay05
test -f relay06 || ln -s /sys/class/gpio/gpio23 relay06
test -f relay07 || ln -s /sys/class/gpio/gpio24 relay07
test -f relay08 || ln -s /sys/class/gpio/gpio25 relay08
chmod +x relay*/value
echo out > relay01/direction; echo 1 > relay01/value
echo out > relay02/direction; echo 1 > relay02/value
echo out > relay03/direction; echo 1 > relay03/value
echo out > relay04/direction; echo 1 > relay04/value
echo out > relay05/direction; echo 1 > relay05/value
echo out > relay06/direction; echo 1 > relay06/value
echo out > relay07/direction; echo 1 > relay07/value
echo out > relay08/direction; echo 1 > relay08/value

#!/usr/bin/expect
# Params
#   $1 - lava instance
#   $2 - admin username
#   $3 - admin password
set instance  [lindex $argv 0]
set adminuser [lindex $argv 1]
set adminpass [lindex $argv 2]
set adminemail "$adminuser@email.com"

spawn /root/lava-deployment-tool/lava-deployment-tool manage $instance createsuperuser
expect "):"
send "$adminuser\n"
expect "address:"
send "$adminemail\n"
expect "Password: "
send "$adminpass\n"
expect "Password (again): "
send "$adminpass\n"
expect "#"

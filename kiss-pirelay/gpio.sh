# usage:    value=on|off port=[1..8] ./gpio.sh

val=1
[ ! $value == on ] ||  val=0   # NOTE: Anything shuts it off, only "on" turns it on 
`echo $val > relay0$port/value`

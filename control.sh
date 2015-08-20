#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Error: This script must be run as root" >&2
   exit 1
fi

ALIVE_PIN="4"
SHUTDOWN_PIN="3"

# Register PINS needed for reboot and alive LED
echo "$SHUTDOWN_PIN" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio"$SHUTDOWN_PIN"/direction
echo "$ALIVE_PIN" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio"$ALIVE_PIN"/direction

# Run on alive LED
echo "1" > /sys/class/gpio/gpio"$ALIVE_PIN"/value

while ( true )
do
    # check if the pin is connected to GND and, if so, halt the system
    if [ $(</sys/class/gpio/gpio"$SHUTDOWN_PIN"/value) == 0 ]
    then
        echo "0" > /sys/class/gpio/gpio"$ALIVE_PIN"/value
        echo "$SHUTDOWN_PIN" > /sys/class/gpio/unexport
        echo "$ALIVE_PIN" > /sys/class/gpio/unexport
        shutdown -h now "System halted by a GPIO action"
    fi
    sleep 1
done

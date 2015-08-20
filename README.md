# control-pi
Small RaspberryPi2 control scrips


## Installation
Place script in `/root/control.sh` and run the command:

    echo "@reboot        root    /home/control.sh" >> /etc/crontab

You might need to prepend `sudo` to this command if you are not root.

## Wireing
For the (soft) reboot, wire the button to the GPIO3 pin, and to the GND next to it.

For the booted LED, figure out what resistance you need for the LED (or you might burn of the board),
and place the LED in serial with the resistor into GPIO4, and the GND "below" it.

There is a GPIO overview here: https://www.raspberrypi.org/learning/quick-reaction-game/worksheet/

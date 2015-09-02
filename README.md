# control-pi
Small RaspberryPi2 control scrips


## Installation
Place script in `/root/control.sh` and add the line:

    /home/control.sh &

, to the file `/etc/rc.local` before the `exit` command.

You can edit the file with somthing like `sudo nano /etc/rc.local`.

To make the file executable run: `chmod +x /root/control.sh` as root (or
with sudo).

## Wiring
For the (soft) reboot, wire the button to the GPIO3 pin, and to the GND next to it.

For the booted LED, figure out what resistance you need for the LED (or you might burn of the board),
and place the LED in serial with the resistor into GPIO4, and 3.3v. This
way the current should run from the 3.3v to the GPIO.

There is a GPIO overview here: https://www.raspberrypi.org/learning/quick-reaction-game/worksheet/

## Radio
For the radio, place the `radio.sh`-file in pi's home directory
(`/home/pi/radio.sh`), and add:

    * * * * * /home/pi/radio.sh

, to the pi users crontab (`crontab -e`).

Then make the file executable with: `chmod +x /home/pi/radio.sh` as root (or
with sudo).


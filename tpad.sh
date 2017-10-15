#!/bin/bash

#get Device ID.
DEVID=$(xinput --list|grep -i 'touch' | cut -b 55-56)

#get Current State of device. 
STATE=$(xinput list-props $DEVID | grep 'Device Enabled' | cut -d ":" -f2)


#set Device ID to off if on, and vice versa.
if [ $STATE == 1 ] 
then
    echo "disabling touchpad"
    xinput set-prop $DEVID "Device Enabled" 0
else
    echo "enabling touchpad"
    xinput set-prop $DEVID "Device Enabled" 1
fi

#test

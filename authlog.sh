#!/bin/bash

AUTHLINES=15
ACCEPTED=10
FAILED=10
SLEEPTIME="3s"


while true;
do
        echo -en "\ec" 
        echo "#########################################"
    	echo "Last $AUTHLINES lines of Auth Log"
        echo "#########################################"
        sudo tail -n $AUTHLINES /var/log/auth.log | grep -v "/var/auth/auth.log"
        echo
        echo "#########################################" 
        echo "Last $ACCEPTED Accepted login attempts:"
        echo "#########################################"
        sudo grep 'Acc*' /var/log/auth.log | grep -v "/var/log/auth.log" |  tail -n $ACCEPTED
        echo 
        echo "#########################################" 
        echo "Last $FAILED Failed Login attempts:"
        echo "#########################################"
        sudo grep 'fail*' /var/log/auth.log |grep -v "/var/log/auth.log" |  tail -n $FAILED
        sleep $SLEEPTIME       

done


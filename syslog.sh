#script for viewing the last $AMOUNT log items 

AMOUNT=58 
SLEEP=5s
while true; do
 echo -en "\ec"
 echo "###########################################"
 echo "Last $AMOUNT lines of /var/log/syslog"
 echo "###########################################"
 sudo tail -n $AMOUNT /var/log/syslog 
 sleep $SLEEP
done



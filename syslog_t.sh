
#Loops through syslog, only showing only current items. 

ST=1
LN=25

while true; 
do
    clear;
    sudo tail -n $LN /var/log/syslog | grep "$(date | cut -d" " -f4| cut -b 1-5)";
    sleep "$ST"s; 
done

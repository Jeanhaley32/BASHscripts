#! /bin/bash
# This script if only for Mac OS
# intended to make pulling up a saved wifi password quick

# If No arguments are provided, print preferred networks saved by Wifi Network Interfaces.
if [[ -z $1 ]];
then
  echo "usage: getpasswd.sh <Network Interface>"
  echo "use one of the following Preferred networks"
  echo "-------------------------------------------"
  wireless_Interfaces=""
  for interface in $(ipconfig getiflist);
  do
    # checks if devices is a WiFi Interface.
    if [[ $(ipconfig getsummary $interface | grep InterfaceType | cut -b 19-) = "WiFi" ]];
    then
      # Appends to list of Wifi Interfaces.
      wireless_Interfaces="$wireless_Interfaces $interface"
    fi;
  done

  for interface in $wireless_Interfaces;
  do
    networksetup -listpreferredwirelessnetworks $interface;
  done
  exit 0
fi

pw=$(security find-generic-password -wa "$1")
echo $pw
echo $pw | pbcopy



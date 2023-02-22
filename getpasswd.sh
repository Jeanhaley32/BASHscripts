#! /bin/bash
# This script if only for Mac OS
# intended to make pulling up a saved wifi password quick
networks=""
if [[ -z $1 ]];
then
  echo "usage: getpasswd.sh <Network Interface>"
  echo "use one of the following Preferred networks"
  echo "-------------------------------------------"
  wireless_networks=""
  for network in $(ipconfig getiflist);
  do
    if [[ $(ipconfig getsummary $network | grep InterfaceType | cut -b 19-) = "WiFi" ]];
    then
      wireless_networks="$wireless_networks $network"
    fi;
  done

  for network in $wireless_networks;
  do
    networksetup -listpreferredwirelessnetworks $network;
  done
  exit 0
fi

pw=$(security find-generic-password -wa $1)
echo $pw
echo $pw | pbcopy



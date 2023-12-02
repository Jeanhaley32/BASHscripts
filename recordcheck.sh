#! /bin/bash
# Script created to check when a TXT record for a subdomain becomes available. 
# Saving, because I may want to use some of this in a future script. 
subdomain=<enter your target here>
sleeptime=3 # time between runs, in seconds. 
start=$(date +%s)
while true; do
  result=$(dig TXT $subdomain +short)
  if [ -z "$result" ]; then
    now=$(date +%s)
    duration=$((now - start))
    echo "The TXT record does not exist yet. Checking again in $sleeptime seconds... Running for $duration seconds."
  else
    now=$(date +%s)
    duration=$((now - start))
    echo "Success! The TXT record exists. Total running time: $duration seconds."
  fi
  sleep $sleeptime
  clear
done

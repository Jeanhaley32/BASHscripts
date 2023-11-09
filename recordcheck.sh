#! /bin/bash
# Script created to check when a TXT record for a subdomain became available. 
# Saving, because I may want to use some of this in a future script. 
SUBDOMAIN=<enter your target here>
start=$(date +%s)
while true; do
  result=$(dig TXT $SUBDOMAIN +short)
  if [ -z "$result" ]; then
    now=$(date +%s)
    duration=$((now - start))
    echo "The TXT record does not exist yet. Checking again in 3 seconds... Running for $duration seconds."
  else
    now=$(date +%s)
    duration=$((now - start))
    echo "Success! The TXT record exists. Total running time: $duration seconds."
    break
  fi
  sleep 3
  clear
done

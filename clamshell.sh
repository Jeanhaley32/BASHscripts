#!/bin/bash
# This script logs the lid state to terminal, It will log date + whether the lid has been opened
# or closed. 
# I was able to use this script to diagnose a macbook issue, and see that the lid angle sensor
# on my computer was not functioning as expected.

isClosed(){
# IsClosed uses the ioreg apple command to receive an update on the state of the clamshell
# A 'Yes' indicates closure, and a 'No' should indicate the opposite.
# We filter by 'AppleClamshellState' entries, grab the most recent entry at head, and show only the value
# to the right of the '=' symbol. This should get us a clean yes or no response.
  echo $(ioreg -r -k AppleClamshellState -d 4 | grep AppleClamshellState | head -1 | cut -d '=' -f 2)
}

prevstate="" # Set previous state to nil.

closed="Yes"
open="No"


# Begin main Loop
while true
  do
    state=$(isClosed) # Obtain Lid state  
    if [ "$state" != "$prevstate" ]; then # Check current state against previous state. If changed then something happened. 
      echo "$(date): Lid $( [[ $state == $closed ]] && echo "Closed" || echo "Open" )" # Log what happened. 
    fi
    prevstate=$state # Set prev state as current state.
    sleep 2 # wait 2 seconds and run again
  done

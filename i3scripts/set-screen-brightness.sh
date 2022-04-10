#!/bin/bash

re='^[1-9]$'
if ! [[ $1 =~ $re ]] ; then
    echo 
    echo "Set the brightness and temperature of all connected"
    echo "displays to the given value between 0 and 9"
    echo 
    echo "Usage:"
    echo "  $(basename $0) brightness"
    echo 
    echo "brightness: A float between 1 and 9"
    echo
    exit 1
fi

TEMP=5500  # color temperaure
BRGH=$(echo "0.$1+0.1" | bc)

if (( $(echo "$BRGH < 0.8" | bc -l) )); then
    TEMP=5000
fi
if (( $(echo "$BRGH < 0.5" | bc -l) )); then
    TEMP=4500
fi

redshift -b $BRGH:$BRGH -O $TEMP


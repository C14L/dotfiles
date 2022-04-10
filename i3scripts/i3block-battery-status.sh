#!/usr/bin/env bash

STR=""

for i in $(upower -e | grep '_BAT[0-9]$'); do
    batt=$(upower -i $i | grep -Po '(?<=\s{2}native-path:)\s+BAT[0-9]$')
    perc=$(upower -i $i | grep -Po '(?<=\s{4}percentage:)\s+[0-9]+%$')
    stat=$(upower -i $i | grep -Po '(?<=\s{4}state:)\s+.+$')

    if [ $stat == "charging" ]; then stat="|+|"; fi
    if [ $stat == "fully-charged" ]; then stat=""; fi
    if [ $stat == "discharging" ]; then stat="|-|"; fi

    STR="${STR} ${batt} ${perc} ${stat} "
done

echo -n $STR


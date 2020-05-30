#!/usr/bin/env bash

s=$(\
  nmcli connection show |\
    grep "\bvpn\b" |\
    grep -P "\b(?:wlp|enp)[0-9]+s[0-9a-z]+\b" |\
    while read C; do echo $(echo -n $C | cut -d' ' -f1); done\
  );

if [ "${s}" == "" ]; then echo -n "NO VPN"; else echo -n $s; fi


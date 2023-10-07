#!/bin/bash
if [ -z "$1" ]
then
    read -r '?(in hours) Timeout [0.5]: ' t
else
    t="$1"
fi
(( t = ${t:-0.5}*3600 ))
if [ -z "$SNX_PW" ]
then
    printf 'To set the password permanently, export SNX_PW\n'
    read -r '?cert pass: ' pw
    SNX_PW=$pw
fi
printf "%s" "$SNX_PW" | snx
(sleep $t && snx -d; echo "snx terminated")&
echo "VPN will disconnect in ${t} seconds"

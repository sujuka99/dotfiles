#!/bin/zsh

read '?(in hours) Timeout [0.5]: ' t
(( t = ${t:-0.5}*3600 ))
snx
(sleep $t && snx -d; echo "snx terminated")&
echo "VPN will disconnect in ${t} seconds"

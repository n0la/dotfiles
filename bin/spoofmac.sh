#!/bin/sh

if [ -z $1 ]; then
  echo "$0 [mbox2|reset]"
fi

MAC=""
if [ "$1" = "mbox2" ]; then
  MAC="00:E0:4B:2A:C2:78"
elif [ "$1" = "reset" ]; then
  MAC="00:16:D3:B8:7A:0C"
fi

if [ ! -z $MAC ]; then
  ifconfig em0 ether $MAC
fi

#!/usr/bin/bash
yournumber='29r03'
re='^[0-9]+$'
if ! [[ $yournumber =~ $re ]] ; then
   echo "error: Not a number" >&2; exit 1
fi
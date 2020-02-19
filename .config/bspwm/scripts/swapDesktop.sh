#!/bin/bash

ARG=$1
CURRENT=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3+1}')

CURNAME=$(bspc query -D -d $(echo $CURRENT | awk '{print "^"$1}') --names)
OTHNAME=$(bspc query -D -d $(echo $ARG | awk '{print "^"$1}') --names)

bspc desktop $OTHNAME -n $CURNAME
bspc desktop $(echo ^$CURRENT) -n $OTHNAME

bspc desktop $OTHNAME -s $CURNAME --follow



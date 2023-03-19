#!/bin/bash

MUTE=$(pamixer --get-mute)
VOL=$(pamixer --get-volume)

if [[ $MUTE == 'true' ]]; then
    echo 'MUTE'
else
    echo $VOL
fi

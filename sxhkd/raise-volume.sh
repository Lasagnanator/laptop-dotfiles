#! /bin/bash

VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d " " -f 2 | tr -d .)

if [ ${VOLUME#0} -gt 100 ]
then
    $(wpctl set-volume @DEFAULT_AUDIO_SINK@ 1)
else
    if [ ${VOLUME#0} -lt 100 ]
    then
        $(wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+)
    fi
fi

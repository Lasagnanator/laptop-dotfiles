#! /bin/sh

dwm-msg subscribe layout_change_event | jq -r '.layout_change_event.new_symbol'

# LAYOUT=$(dwm-msg subscribe layout_change_event | jq -r '.layout_change_event.new_symbol')
# if [ -z $LAYOUT ];
# then
#     echo "[]="
# else
#     $LAYOUT
# fi


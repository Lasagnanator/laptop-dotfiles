#! /bin/bash

if [[ ! $(pidof stalonetray) ]]; then
  stalonetray
  xdo hide -n stalonetray
  polybar-msg action "#systray.hook.1"
  touch "/tmp/syshide.lock"
fi

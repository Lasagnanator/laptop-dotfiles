#! /bin/sh

TEST=0

while true; do
    if [ $TEST -eq 0 ];
    then
        echo " YO "
        sleep 1
        TEST=1
    else
        echo "DAWG"
        sleep 1
        TEST=0
    fi
done

#!/bin/bash
#
# Change observer - based on list of files every n seconds
# by Patryk Mazurkiewicz
# June 2018
#

delay=3 # seconds

if [ -z "$1" ]; then

    while [ 1 ]; do
        clear
        ls -lak
        sleep $delay
    done

else

    if [ -d $1 ]; then

        while [ 1 ]; do
            clear
            ls $1 | wc -l
            sleep $delay
        done

    else
    
        echo "Usage: 'chobs.sh' for current dir detailed list or 'chobs.sh dirname' for 'ls dirname | wc -l' summary."

    fi
fi

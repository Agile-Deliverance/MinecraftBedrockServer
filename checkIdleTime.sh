#!/bin/bash

screen -r Birchverse -p0 -X stuff "list" && screen -r Birchverse -p0 -X eval "stuff \015" && sleep 0.5 && screen -r Birchverse -p0 -X hardcopy -h /home/ubuntu/screen.log
players=$(grep "players online" /home/ubuntu/screen.log |tail -n 1)
regex="There are 0"
echo $players

if [[ $players =~ $regex ]]
then
    echo "matched the following text:"
    echo ${BASH_REMATCH[0]}
    if [ ! -f /home/ubuntu/idleSince ]; then
        date +%s > /home/ubuntu/idleSince
    fi
else
    if [ -f /home/ubuntu/idleSince ]; then
	echo "Removing idleSince"
        rm /home/ubuntu/idleSince
    else
        echo "No idleSince to remove"
    fi
fi

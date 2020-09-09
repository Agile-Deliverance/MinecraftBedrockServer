#!/bin/bash

sudo -u ubuntu screen -r BlingMyMc -p0 -X stuff "list"
sudo -u ubuntu screen -r BlingMyMc -p0 -X eval "stuff \015"
sleep 0.5
sudo -u ubuntu screen -r BlingMyMc -p0 -X hardcopy -h /home/ubuntu/screen.log

players=$(grep "players online" /home/ubuntu/screen.log |tail -n 1)
regex="There are 0"

if [[ $players =~ $regex ]]
then
    if [ ! -f /home/ubuntu/idleSince ]; then
        date +%s > /home/ubuntu/idleSince
    fi
    echo $((`date +%s` - `cat /home/ubuntu/idleSince`)) > /home/ubuntu/idleSeconds
else
    if [ -f /home/ubuntu/idleSince ]; then
        rm /home/ubuntu/idleSince
    fi
    echo 0 > /home/ubuntu/idleSeconds
fi

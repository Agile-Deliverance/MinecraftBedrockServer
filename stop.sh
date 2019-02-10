#!/bin/bash
# James Chambers - February 8th 2019
# Minecraft Server stop script - primarily called by minecraft service but can be ran manually

# Check if server is started
if screen -list | grep -q "minecraft"; then
    echo "Server is not currently running!"
    exit 1
fi

screen -Rd minecraft -X stuff "say Closing server (stop.sh called)...$(printf '\r')"
screen -Rd minecraft -X stuff "stop $(printf '\r')"
sleep 10s

if screen -list | grep -q "minecraft"; then
  echo "Minecraft server still hasn't closed after 10 seconds, closing screen manually"
  screen -S minecraft -X quit
fi
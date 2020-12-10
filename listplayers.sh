sudo -u ubuntu screen -r BlingMyMc -p0 -X eval "clear"
sudo -u ubuntu screen -r BlingMyMc -p0 -X eval "scrollback 0"
sudo -u ubuntu screen -r BlingMyMc -p0 -X eval "scrollback 1000"
sudo -u ubuntu screen -r BlingMyMc -p0 -X stuff "list"
sudo -u ubuntu screen -r BlingMyMc -p0 -X eval "stuff \015"
sleep 1
sudo -u ubuntu screen -r BlingMyMc -p0 -X hardcopy -h /home/ubuntu/playerlist

cat /home/ubuntu/playerlist

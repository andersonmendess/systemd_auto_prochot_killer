#!/bin/sh
echo "installing prochot killer service"
sudo cp system/kill.prochot.service /etc/systemd/system/kill.prochot.service
sudo cp bin/prochot.sh /usr/local/bin/prochot.sh
sudo chmod 777 /usr/local/bin/prochot.sh
sudo systemctl daemon-reload
sudo systemctl enable kill.prochot.service
sudo systemctl start kill.prochot.service
echo "Done!"

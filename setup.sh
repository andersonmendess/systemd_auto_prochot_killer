#!/bin/bash

os=$(grep '^ID_LIKE=' /etc/os-release | sed "s/ID_LIKE=//")
if [ ! $os ]; then
	os=$(grep '^ID=' /etc/os-release | sed "s/ID=//")
fi

echo "Detecting SO"
sleep 1s
if [ $os == "debian" ]
	then
		echo "Debian Detected..."
		sleep 2s
		sudo apt-get install msr-tools -y
elif [ $os == "arch" ]
	then
		echo "Arch Detected..."
		sleep 2s
		sudo pacman -S msr-tools --noconfirm
else
	echo "WARN: unknown SO... Please install the msr-tools package manually"
fi

sleep 2s

echo "installing prochot killer service"
sudo cp system/kill.prochot.service /etc/systemd/system/kill.prochot.service
sudo install bin/prochot.sh /usr/local/bin/prochot.sh
sudo systemctl daemon-reload
sudo systemctl enable --now kill.prochot.service
echo "Done!"

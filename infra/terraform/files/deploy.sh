#!/bin/bash
set -e

source ~/.profile
git clone https://github.com/Artemmkin/raddit.git reddit
cd reddit
bundle install
echo "added puma service"
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
echo "systemctl start puma"
sudo systemctl start puma
echo "systemctl enable puma"
sudo systemctl enable puma

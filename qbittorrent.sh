#!/bin/bash
sudo apt-get install qbittorrent-nox -y;
sudo useradd -r -m qbittorrent;
sudo usermod -a -G qbittorrent root;
sudo cp config-files/qbittorrent.service /etc/systemd/system/;
echo "port 8001";
sudo systemctl start qbittorrent;
sudo systemctl status qbittorrent;
sudo systemctl enable qbittorrent;
echo "default login: admin";
echo "default login: adminadmin";
echo "Please, change it in Tools > Options > Downloads";

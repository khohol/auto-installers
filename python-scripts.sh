#!/bin/bash
sudo useradd -r -m python-scripts;
sudo usermod -a -G python-scripts root;
sudo cp config-files/python-scripts.service /etc/systemd/system/;
echo "sudo systemctl start python-scripts";
echo "sudo systemctl status python-scripts";
echo "sudo systemctl enable python-scripts";

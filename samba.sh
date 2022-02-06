#!/bin/bash
sudo apt-get install samba samba-common-bin -y;
sudo rm /etc/samba/smb.conf;
sudo cp config-files/smb.conf /etc/samba/;
echo "/etc/samba/smb.conf";
echo "Print samba password";
sudo smbpasswd -a root;
sudo systemctl restart smbd;

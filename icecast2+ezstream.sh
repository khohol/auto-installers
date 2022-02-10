#!/bin/bash
sudo mv config-files/ezstream.xml /opt/
sudo mv config-files/online-radio.service /opt/
echo "Installing icecast2. Please, configure it";
sudo apt-get install icecast2 -y;
sudo systemctl enable icecast2;
sudo systemctl start icecast2;
sudo useradd -r -m online-radio;
sudo usermod -a -G online-radio root;
echo "Installing ezstream";
sudo apt-get install libshout3-dev libxml2-dev libtag1-dev libshout3-dev libvorbis-dev libogg-dev check libtag-extras-dev libtagc0-dev -y;
cd /home/online-radio;
sudo wget http://downloads.xiph.org/releases/ezstream/ezstream-0.6.0.tar.gz;
sudo tar xvzf ezstream-0.6.0.tar.gz;
cd ezstream-0.6.0;
libtoolize --force;
aclocal;
autoheader;
automake --force-missing --add-missing;
autoconf;
autoreconf -f;
./configure;
make;
sudo make install;
echo "Check version!";
ezstream -V;
sudo mv /opt/ezstream.xml /etc/icecast2/
echo "Set your local IP in file and icecast2 password";
sudo mv /opt/online-radio.service /etc/systemd/system/
sudo systemctl enable online-radio;
sudo systemctl start online-radio;
sudo systemctl status online-radio;
echo "icecast2 menu: http://[your_ip]:8000";
echo "stream: http://[your_ip]:8000/stream";

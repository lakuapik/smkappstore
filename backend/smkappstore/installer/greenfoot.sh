#!/bin/bash
#installer aplikasi Greenfoot

cd /tmp/
wget --continue http://www.greenfoot.org/download/files/Greenfoot-linux-310.deb
sudo dpkg -i Greenfoot-linux-310.deb
sudo apt-get install -f

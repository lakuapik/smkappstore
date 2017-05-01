#!/bin/bash
#installer GNS3 -saat ini blm support 32bit

if [ `getconf LONG_BIT` == "64" ]; then
 #64bit
 sudo add-apt-repository ppa:gns3/ppa -y
 sudo apt-get update -y
 sudo apt-get install -f gns3-gui -y

else
 #32bit
 lxterm -e echo "^MOHON MAAF^ GNS3 belum dapat berjalan di OS 32bit :("

fi

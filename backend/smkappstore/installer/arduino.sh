#!/bin/bash
#installer alikasi arduino

if [ `getconf LONG_BIT` == "64" ]; then
 #64bit
 cd /tmp/
 wget --continue https://downloads.arduino.cc/arduino-1.8.2-linux64.tar.xz
 cd /opt/
 sudo tar -xvf /tmp/arduino-1.8.2-linux64.tar.xz

else
 #32bit
 cd /tmp/
 wget --continue https://downloads.arduino.cc/arduino-1.8.2-linux32.tar.xz
 cd /opt/
 sudo tar -xvf arduino-1.8.2-linux32.tar.xz
fi

cd arduino-1.8.2
sudo sh install.sh


#membuat alikasi
sudo echo -e "cd /opt/arduino*/ && ./arduino" >> /usr/bin/arduino
sudo chmod +x /usr/bin/arduino

<<COMMENT1
#membuat icon di desktop
cd ~/Desktop/
echo -e "[Desktop Entry]
Name=Arduino IDE
Exec=/opt/arduino-1.8.2/arduino
Path=/opt/arduino-1.8.2/
Icon=/opt/arduino-1.8.2/lib/arduino_icon.ico
Terminal=false
Type=Application
Categories=Programing;
" >> arduino.desktop
chmod +x ~/Desktop/arduino.desktop
COMMENT1

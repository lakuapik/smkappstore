#!/bin/bash
#installer alikasi Sublime Text 2

if [ `getconf LONG_BIT` == "64" ]; then
 #64bit
 cd /tmp/
 wget --continue https://download.sublimetext.com/Sublime%20Text%202.0.2%20x64.tar.bz2

else
 #32bit
 cd /tmp/
 wget --continue https://download.sublimetext.com/Sublime%20Text%202.0.2.tar.bz2
fi

cd /opt/
sudo tar -xvf /tmp/Sublime*
cd Sublime*

#membuat alikasi
sudo echo -e "cd /opt/Sublime*/ && ./sublime_text" >> /usr/bin/sublime-text
sudo chmod +x /usr/bin/sublime-text

#!/bin/bash
#installer untuk NetBeans IDE


if [ `getconf LONG_BIT` == "64" ]; then
 #64bit
 cd /tmp/
 wget --continue https://download.sublimetext.com/sublime-text_build-3126_amd64.deb

else
 #32bit
 cd /tmp/
 wget --continue https://download.sublimetext.com/sublime-text_build-3126_i386.deb
fi

mv sublime* sublime.deb
sudo dpkg -i sublime.deb

echo "DONE!"

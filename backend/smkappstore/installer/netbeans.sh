#!/bin/bash
#installer untuk NetBeans IDE


if [ `getconf LONG_BIT` == "64" ]; then
 #64bit
 cd /tmp/
 wget --continue https://archive.org/download/jdk-8-netbeans-8.2-linux/jdk-8u131-nb-8_2-linux-x64.sh

else
 #32bit
 cd /tmp/
 wget --https://archive.org/download/jdk-8-netbeans-8.2-linux/jdk-8u131-nb-8_2-linux-i586.sh
fi

cp jdk* netbeans.sh
sh netbeans.sh

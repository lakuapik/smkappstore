if [ `getconf LONG_BIT` == "64" ]; then
 #64bit
 cd /tmp/
 wget --continue http://download.tuxfamily.org/qet/tags/20151127/debian/stable-Qt5.3/amd64/qelectrotech-data_0.50.r4276-2_all.deb
 wget --continue http://download.tuxfamily.org/qet/tags/20151127/debian/stable-Qt5.3/amd64/qelectrotech-examples_0.50.r4276-2_all.deb
 wget --continue http://download.tuxfamily.org/qet/tags/20151127/debian/stable-Qt5.3/amd64/qelectrotech_0.50.r4276-2_amd64.deb
 sudo dpkg -i qelectrotech*.deb

else
 #32bit
 cd /tmp/
 wget --continue http://download.tuxfamily.org/qet/tags/20151127/debian/stable-Qt5.3/i386/qelectrotech-data_0.50.r4276-2_all.deb
 wget --continue http://download.tuxfamily.org/qet/tags/20151127/debian/stable-Qt5.3/i386/qelectrotech-examples_0.50.r4276-2_all.deb
 wget --continue http://download.tuxfamily.org/qet/tags/20151127/debian/stable-Qt5.3/i386/qelectrotech_0.50.r4276-2_i386.deb
 sudo dpkg -i qelectrotech*.deb
fi

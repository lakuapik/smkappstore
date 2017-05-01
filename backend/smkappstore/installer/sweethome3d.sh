cd /tmp/
if [ `getconf LONG_BIT` == "64" ]; then
 #64bit
 wget --continue https://ncu.dl.sourceforge.net/project/sweethome3d/SweetHome3D/SweetHome3D-5.4/SweetHome3D-5.4-linux-x64.tgz
 cp SweetHome3D*.tgz sweethome.tgz
else
 #32bit
 wget --continue https://ncu.dl.sourceforge.net/project/sweethome3d/SweetHome3D/SweetHome3D-5.4/SweetHome3D-5.4-linux-x86.tgz
 cp SweetHome3D*.tgz sweethome.tgz
fi

sudo tar -xvf sweethome.tgz
sudo mv SweetHome3D-5.4/ /opt/sweethome3d/

#membuat alikasi
sudo echo -e "cd /opt/sweethome3d/ && ./SweetHome3D" >> /usr/bin/sweethome3d
sudo chmod +x /usr/bin/sweethome3d

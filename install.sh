#!/bin/bash
echo "Pemasangan SMK APP STORE..."
echo ">> pemasangan backend dan dependencies..."
echo ">> mengecek ignsdk..."
ignsdk -v > /dev/null 2>&1
if [ $? -eq 0 ]; then
 #sudah ada ignsdk
 echo ">> ingsdk ditemukan!"
else
 echo ">> ingsdk belum ada, memasang ignsdk..."
 sudo add-apt-repository ppa:ignsdk/sdk -y
 sudo apt-get update && sudo apt-get install ignsdk -y
fi
echo ">> menyalin folder backend..."
sudo cp -r backend/smkappstore /opt/
sudo chmod +x /opt/smkappstore/main.py
sudo chmod +x /opt/smkappstore/installer/ -R
echo ">> memasang smkappstore..."
sudo dpkg -i smkappstore*.deb

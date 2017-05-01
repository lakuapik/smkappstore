#!/bin/bash
# installer aplikasi Estru 3D bangunan

cd /tmp
wget --continue https://downloads.sourceforge.net/project/estru3d/estru3d_0.1.0-0ubuntu1_all.deb
sudo dpkg -i estru3d*.deb

#!/bin/bash
#installer aplikasi Kicad

sudo add-apt-repository --yes ppa:js-reynaud/kicad-4 -y
sudo apt update -y
sudo apt install -f kicad -y

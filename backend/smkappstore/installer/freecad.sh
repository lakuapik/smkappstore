#!/bin/bash
#installer untuk FreeCAD

sudo add-apt-repository ppa:freecad-maintainers/freecad-stable -y
sudo apt-get update -y
sudo apt-get install -f freecad -y

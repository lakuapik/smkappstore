#!/bin/bash
#installer aplikasi qucs

sudo apt-add-repository ppa:qucs/qucs -y
sudo apt-get update -y
sudo apt-get install -f qucs -y

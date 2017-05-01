#!/bin/bash
#installer untuk Packet Tracer 7

if [ `getconf LONG_BIT` == "64" ]; then
 #64bit
 cd /tmp/
 wget --continue https://archive.org/download/PacketTracer7032bitLinux.tar/PacketTracer70_64bit_linux.tar.gz
 cp PacketTracer70_64bit_linux.tar.gz pt.tar.gz

else
 #32bit
 cd /tmp/
 wget --continue https://archive.org/download/PacketTracer7032bitLinux.tar/PacketTracer70_32bit_linux.tar.gz
 cp PacketTracer70_32bit_linux.tar.gz pt.tar.gz
fi

cd /tmp
tar -xzvf pt.tar.gz
cd PacketTracer*
lxterm -e ./install -y

echo "DONE!"

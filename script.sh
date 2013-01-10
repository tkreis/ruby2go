#!/bin/bash

OS=$(lsb_release -si)								# OS (Distro Name)
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
VER=$(lsb_release -sr)



case $OS in
	Ubuntu | Debian)
	sudo apt-get install curl git vim 
	;;
	Fedora)
	;;
esac
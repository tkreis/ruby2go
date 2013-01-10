#!/bin/bash

OS=$(lsb_release -si)								# OS (distro name)
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')	# Processor architecture
VER=$(lsb_release -sr)								# OS release version



case $OS in
	Ubuntu|Debian)
		sudo apt-get install curl
	;;
	Fedora)
		yum install curl
	;;
esac
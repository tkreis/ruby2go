#!/bin/bash
echo -e "\e[1;37mWelcome to Ruby2Go: The best way to install Ruby.\e[0m" #Print logo
OS=$(lsb_release -si)								# OS (distro name)
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')	# Processor architecture
VER=$(lsb_release -sr)								# OS release version

#Checks if a command exits: Returns 1 if the command exits
checkcommand(){
	if type $1 > /dev/null 2>&1; then
  		echo "1"
	else echo "0"
	fi
}

curl=$(checkcommand "curl");
git=$(checkcommand "git");


case $OS in
	Ubuntu|Debian|LinuxMint)
		if [ $curl == 0 ]; then
			echo -e "\e[1;37mInstalling Curl.\e[0m" #A little print 
			sudo apt-get install curl
		fi
		if [ $git == 0 ]; then
			echo -e "\e[1;37mInstalling Git.\e[0m" #A little print 
			sudo apt-get install git
		fi
	;;
	Fedora)
		if [ $curl == 0 ]; then
			echo -e "\e[1;37mInstalling Curl.\e[0m" #A little print 
			yum install curl
		fi
		if [ $git == 0 ]; then
			echo -e "\e[1;37mInstalling Git.\e[0m" #A little print 
			yum install git
		fi
		
	;;
esac

echo -e "\e[1;37mGreat, you've got everything installed. Happy Coding.\e[0m" #Print logo



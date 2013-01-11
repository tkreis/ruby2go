#!/bin/bash
# Nearsoft, Inc.
# Nearsoft Labs

echo -e "\e[1;37mWelcome to Ruby2Go: The best way to install Ruby.\e[0m"    #Print logo

#########################################
### Choose the proper package manager ###
#########################################

# Checks if evaluated package manager is installed
haveProg() {
    [ -x "$(which $1)" ]
}

installRubyRequirements(){
	output=$(rvm requirements)
	RUBY_REGEX='ruby:(.*)'
	if [[ $output =~ $RUBY_REGEX ]]; then
		requirements="${BASH_REMATCH[1]}"
		sudo $requirements
	fi
	sudo -k
}

assignPacMan() {
    pack = $1
}

# The package manager instalation command string is stored in the 'pack' variable
if haveProg apt-get ; then pack="apt-get install -y"
elif haveProg yum ; then pack="yum install"
elif haveProg pacman ; then pack="pacman -S"
else
    echo 'No package manager found!'
    exit 2
fi



#################################################
### Functions for installation of requirements ###
#################################################

# Checks if a command exits: Returns 1 if the command exits
isInstalled(){
    if type $1 > /dev/null 2>&1; then
        echo "1"
    else echo "0"
    fi
}

install(){
    check=$(isInstalled $1);
    if [ $check == 0 ]; then
            echo -e "Installing $1." #A little print
            $pack $1
    fi
}

####################################
### Installation of requirements ###
####################################

install "curl"
install "git"
\curl -L https://get.rvm.io | bash -s stable --ruby
installRubyRequirements
echo -e "Great, you've got everything installed. Happy Coding." #Print logo

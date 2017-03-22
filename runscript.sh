#!/bin/bash
clear
###
#
#	Run Script 16.10 64-bit
#
#	Lead Author: Lee Hodson
#	Donate: paypal.me/vr51
#	Website: https://github.com/VR51/Ubuntu-Runscript
#	First Written: 21st Jan. 2016
#	First Release: 21st Jan. 2016
#	This Release: 21th March. 2017
#
#	Copyright 2016 Lee Hodson
#	License: GNU
#
#	Author: Lee Hodson <https://journalxtra.com>, Lee Hodson <https://vr51.com>
#
#	Use of this program is at your own risk
#
#	TO RUN:
#
#	- Ensure the script is executable.
#	- Command line: sh runscript.sh
#	- File browser: Make script executable, click runscript.sh
#
#	Use Runscript to install base repositories and software after fresh Ubuntu 16.10 or Kubuntu 16.10 installation.
#	Will work for KDE Neon but you will need to comment out Kubuntu Backports
#	This is for 64 bit systems.
#	Installs Backports, y-ppa-manager, vlc, gimp (latest), krita (latest), google-chrome-stable, webcamstudio, simplescreenrecorder, MAME, QMC2, virtualbox-5.1, apache2, php7.0, mariadb-server, php7.0-mysql, phpmyadmin, openshot-qt, Webmin, Mod_Pagespeed
#	You will need to configure Apache modules through either terminal or Webmin after installation has completed.
#
#	I am a web developer and Linux script writer. This runscript installs server software as well as some tools of my trade and other packages I enjoy to use for entertainment.
#
###


###
#
#	EXTRAS
#
#	https://www.google.com/linuxrepositories/
#
#	https://journalxtra.com/gaming/download-complete-sets-of-mess-and-mame-roms/
#
###


###
#
#	Let the user know we are running
#
###

printf "RUNSCRIPT INITIALISED\n------------------------\n\n"

###
#
#	Set Variables
#
###

# Establish Linux epoch time in seconds
now=$(date +%s)

# Establish both Date and Time
todaytime=$(date +"%Y-%m-%d-%H:%M:%S")

# Locate Where We Are
filepath="$(dirname "$(readlink -f "$0")")"


###
#
#	Register leave_program function
#
###


leave_program() {

	exittime=$(date +%s)
	runtime=$(($exittime - $now))

	printf "\nPROGRAM RUN TIME: $runtime seconds\n"
	printf "\n\nPress any key to exit"
	read something
	exit

}


###
#
#	Confirm we are running in a terminal
#		If not, try to launch this program in a terminal
#
###

tty -s

if test "$?" -ne 0
then

	# This code section is released in public domain by Han Boetes <han@mijncomputer.nl>
	# Updated by Dave Davenport <qball@gmpclient.org>
	# Updated by Lee Hodson <https://journalxtra.com> - Added break on successful hit, added more terminals, humanized the failure message, replaced call to rofi with printf and made $terminal an array for easy reuse.
	#
	# This script tries to exec a terminal emulator by trying some known terminal
	# emulators.
	#
	# We welcome patches that add distribution-specific mechanisms to find the
	# preferred terminal emulator. On Debian, there is the x-terminal-emulator
	# symlink for example.

	terminal=( x-terminal-emulator xdg-terminal konsole gnome-terminal terminator urxvt rxvt Eterm aterm roxterm xfce4-terminal termite lxterminal xterm )
	for i in ${terminal[@]}; do
		if command -v $i > /dev/null 2>&1; then
			exec $i -e "$0"
			break
		else
			printf "\nUnable to automatically determine the correct terminal program to run e.g Console or Konsole. Please run this program from a terminal AKA the command line.\n"
			read something
			leave_program
		fi
	done

fi

###
#
#	Obtain Authorisation to update the system
#
###

# Add event to run.log

printf "\n\nAUTHORISATION\n-------------\n"

printf "\nAuthorise System Reposet to update the system:\n"
sudo -v

###
#
#	Install repositories and GPG keys
#
###


## Kubuntu Backports

sudo apt-add-repository ppa:kubuntu-ppa/ppa
sudo add-apt-repository ppa:kubuntu-ppa/backports

## VirtualBox

sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian yakkety contrib" >> /etc/apt/sources.list.d/virtualbox.list'
sudo wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

## Web Server

sudo apt-add-repository ppa:ondrej/apache2
sudo apt-add-repository ppa:ondrej/php

sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64,i386] http://lon1.mirrors.digitalocean.com/mariadb/repo/10.1/ubuntu yakkety main'

sudo sh -c 'echo "deb http://ppa.launchpad.net/nijel/phpmyadmin/ubuntu yakkety main" >> /etc/apt/sources.list.d/nijel-ubuntu-php-myadmin-yakkety.list'
sudo sh -c 'echo "deb-src http://ppa.launchpad.net/nijel/phpmyadmin/ubuntu yakkety main" >> /etc/apt/sources.list.d/nijel-ubuntu-php-myadmin-yakkety.list'


## PhpMyAdmin

sudo apt-add-repository ppa:nijel/phpmyadmin

## Webmin
# PPA is still on 'sarge' so we download and install the .deb package (further down this page).
# Update from within Webmin.

# sudo echo "\n# Webmin" >> /etc/apt/sources.list
# sudo echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
# sudo echo "deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" >> /etc/apt/sources.list
# wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -

## Google Chrome

wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

## Gimp
# Beta versions

sudo apt-add-repository ppa:otto-kesselgulasch/gimp

## Krita
# https://krita.org/download/krita-desktop/

sudo add-apt-repository ppa:dimula73/krita

## Web Update YPPA Manager

sudo add-apt-repository ppa:webupd8team/y-ppa-manager

## Openshot Video Editor

sudo add-apt-repository ppa:openshot.developers/ppa

## Webcamstudio

sudo add-apt-repository ppa:webcamstudio/webcamstudio-dailybuilds

## Simple Screen Recorder

sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder

## MAME (this is now MAME and MESS together)

sudo add-apt-repository ppa:c.falco/mame

## QMC2 MAME GUI/Frontend

sudo add-apt-repository ppa:mmbossoni-gmail/emu

###
#
#	Update Everything
#
###

sudo apt-get update
sudo apt-get --with-new-pkgs upgrade
sudo apt-get dist-upgrade

###
#
#	Install Packages.
#       Each to a line to make it easy to follow
###

sudo apt-get install software-properties-common
sudo apt-get install y-ppa-manager
sudo apt-get install vlc
sudo apt-get install gimp
sudo apt-get install krita
sudo apt-get install google-chrome-stable
sudo apt-get install webcamstudio
sudo apt-get install virtualbox-5.1
sudo apt-get install dkms
sudo apt-get install apache2
sudo apt-get install php7.0
sudo apt-get install mariadb-server
sudo apt-get install php7.0-mysql
sudo apt-get install phpmyadmin
sudo apt-get install openshot-qt
sudo apt-get install simplescreenrecorder

## Webmin dependencies
apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python

## Install Webmin
# PPA is still on 'sarge' so we download and install the .deb package. Update from within Webmin.
# See http://www.webmin.com/deb.html
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.831_all.deb
sudo dpkg --install webmin_1.831_all.deb

## Mod_Pagespeed

wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb
sudo dpkg -i mod-pagespeed-*.deb
sudo apt-get -f install

## MAME and QMC2

sudo apt-get install mame mame-data qmc2-sdlmame qmc2-arcade qmc2-data qchdman

###
#
#	Advise Status Complete
#
###

printf "\nSOFTWARE INSTALLED\n"

prompt_confirm() {
  while true; do
    read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY
    case $REPLY in
      [yY])
		sudo apt-get clean
		sudo apt-get autoremove
		printf "Press any key to exit."
		read something
		leave_program
		;;

      [nN])
		leave_program
		;;

      *)
		printf "\033[31m %s \n\033[0m" "Answer 'y' to proceed or 'n' to exit."
    esac
  done
}

prompt_confirm "Clean the cache of downloaded packages and run autoremove?" || exit 0

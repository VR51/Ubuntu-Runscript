# Ubuntu-Runscript
Adds a collection of software repositories to *buntu distros and installs specific software pacakges.

Designed for use with a clean install of Kubuntu or Ubuntu. This is the script I use to create my preferred software environment after clean (re)installation of Kubuntu.

Take note that I'm a web developer. This runscript installs among other software Apache2, PHP7, MariaDB, Webmin and PhpMyAdmin. If you do not need the web server components you will need to delete the sections of the script that install them. I will release a Q&A version of this script soon.

# Version

16.04 Xenial.

If using in a different release of Ubuntu  you will need to update 'xenial' in some repos to whatever the Ubuntu release is.

# How to Use
Download the script to your desktop. Click the file runscript.sh. If it fails to run check the file is set to be 'executable' or open a terminal and type 'sh runscript.sh' (withuot the quotes).

Use once only. The script does not check whether repos are already installed.

# Repositories Enabled
* ppa:kubuntu-ppa/ppa
* ppa:kubuntu-ppa/backports
* deb http://download.virtualbox.org/virtualbox/debian xenial contrib
* ppa:ondrej/apache2
* ppa:ondrej/php
* http://mirrors.coreix.net/mariadb/repo/10.1/ubuntu xenial main
* http://ppa.launchpad.net/nijel/phpmyadmin/ubuntu xenial main
* ppa:nijel/phpmyadmin
* deb http://dl.google.com/linux/chrome/deb/ stable main
* ppa:otto-kesselgulasch/gimp
* ppa:dimula73/krita
* ppa:webupd8team/y-ppa-manager
* ppa:openshot.developers/ppa
* ppa:webcamstudio/webcamstudio-dailybuilds

# Software Installed
* y-ppa-manager (graphical PPA repository manager)
* vlc
* gimp (latest beta version)
* krita
* google-chrome-stable
* webcamstudio
* virtualbox-5.0 (For Virtual OS Installation)
* apache2 (Web server)
* php7.0
* mariadb-server
* phpmyadmin
* openshot-qt (Video Editor)
* Webmin
* Mod Pagespeed

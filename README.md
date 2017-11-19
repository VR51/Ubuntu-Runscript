# Ubuntu-Runscript

Software collection installer for *ubuntu distros. Works with KDE Neon too. Runscript assumes it is being run in the 17.10 Artful release.

This is an interactive software installer that adds preconfigured sets of useful software packages to Ubuntu and Kubuntu distros, including KDE Neon.

- Runscript installs repositories and software as detailed in this readme.
- Runscript is useful for populating a freshly installed OS with default software repos and packages.
- Runscript can be used to add software to a non fresh OS.

Runscript will prompt for confirmation before any repos or software are installed. First the repository installer prompt then the software installer prompt for each package set.

This double opt-in prompt allows time to reconsider the first response or to choose to add the repos then add the software later.

# Features

- Configurable
- User friendly
- Interactive

# Version
Artful. Released 20th November 2017

If using in a different release of Ubuntu you will need to change 'yakketti' in some of the repo lines in the code to whatever your Ubuntu release is.

# How to Use

## Desktop
- Download the script to your desktop.
- Click the file runscript.sh.
- If it fails to run check the file is set to be 'executable'

## Commandline
- Make the file executable
- Open a terminal
- Browse to the file directory
- type ./runscript 

# Software Packages
## BASIC:

- Backports (repository)
- y-ppa-manager
- vlc
- gimp (latest)
- krita (latest)
- google-chrome-stable
- webcamstudio
- openshot-qt
- simplescreenrecorder
- virtualbox-5.1

##	MAME:

- MAME
- QMC2

##	SERVER

- apache2
- php7.0
- php7.0-mysql + other standard PHP7 modules
- mariadb-server 10.2
- phpmyadmin
- Webmin
- Mod_Pagespeed

# Notes
After Webmin is installed you will need to set the user password:

- sudo /usr/share/webmin/changepass.pl /etc/webmin root NEWPASSWORD

You can customize the exact software in each package set by adding or removing their program titles (as known in the repo) to the package lists e.g. add software to or remove software from the basicPackage or the serverPackage.

# History
Runscript was written to facilitate the installation of web servers and the reinstallation of Kubuntu. The name comes from 'Run the script to install packages'.

This started as a qickly written click-to-run script that had no prompts. The idea was to get the job done with as few questions as possible. Now we have prompts to confirm the changes to be made to an OS system.

# Future

- autodetection of OS version + warning if OS too old for script to function
- more modularisation.

# Donate

Send donations to https:/paypal.me/vr51/

# Ubuntu-Runscript

Software collection installer for *ubuntu distros. Works with KDE Neon too. Runscript assumes it is being run in the 21.01 hirsute release.

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
Hirsute. Released 25th Sep 2021

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

# Software Packages / PPAs
## BASIC REPOS & UTILITIES:

- Backports (extra Ubuntu official repository)
- y-ppa-manager (PPA repository manager)
- vlc (multimedia player and streamer)
- gimp (latest) (graphics app)
- krita (latest) (graphics app)
- google-chrome-stable (web browser)
- opera-stable (web browser)
- brave (web browser)
- webcamstudio (web camera controller)
- openshot-qt (screenshot manager)
- simplescreenrecorder (screen recorder)
- virtualbox (OS virtualiser)
- LyX (advanced text editor)

## MAME:

- MAME (arcade, personal computer and home cnosole emulator)
- QMC2 (software manager for MAME)
- See more info at https://journalxtra.com/gaming/download-complete-sets-of-mess-and-mame-roms/

## SERVER

- apache2
- php7.4
- php7.4-mysql + other standard PHP7 modules
- php8*
- mariadb-server 10.6
- phpmyadmin
- Webmin
- Mod_Pagespeed

# Notes

After Webmin is installed you will need to set the user password:

- sudo /usr/share/webmin/changepass.pl /etc/webmin root NEWPASSWORD

You can customize the exact software in each package set by adding or removing their program titles (as known in the repo) to the package lists e.g. add software to or remove software from the basicPackage or the serverPackage.

Brave is a privacy focused web browser. Go through the settings to increase your security.
Opera is included because it has a built in VPN and other useful features.

# History

Runscript was written to facilitate the installation of web servers and the reinstallation of Kubuntu. The name comes from 'Run the script to install packages'.

This started as a qickly written click-to-run script that had no prompts. The idea was to get the job done with as few questions as possible. Now we have prompts to confirm the changes to be made to an OS system.

# Future

- autodetection of OS version + warning if OS too old for script to function
- more modularisation.

# Donate

Send donations to https:/paypal.me/vr51/

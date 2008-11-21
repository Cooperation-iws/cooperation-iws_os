#!/bin/bash
cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto




#sudo ./cooperation-iws.py -c --createdirectories --modulesfile templates/dev-server --debmirror http://127.0.0.1:81/deb/mirror/ftp.fr.debian.org/debian/ --debmirrornonfree http://127.0.0.1:81/deb/mirror/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://127.0.0.1:81/deb/mirror/security.debian.org/ --directory /media/partage-dev/tmp/1b07 --host ciwsdev  --outputisoname ciwdev-0.7.0.iso --keyblang fr --debianlive --webappmirror http://127.0.0.1:81/depot --encryption aes256 --encryptionpassphrase 04071976041219420407 --ostype Client --silent --disautologin --password Mekir9 --username esmalif --debianflavor gnome-desktop

sudo ./cooperation-iws.py -c --createdirectories --modulesfile templates/perso_home --debmirror http://127.0.0.1:81/deb/mirror/ftp.fr.debian.org/debian/ --debmirrornonfree http://127.0.0.1:81/deb/mirror/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://127.0.0.1:81/deb/mirror/security.debian.org/ --directory /media/partage-dev/tmp/1b19 --host lokaleskiv --outputisoname ciwlokal-0.7.0.iso --keyblang fr --debianlive --webappmirror http://127.0.0.1:81/depot --encryption aes256 --encryptionpassphrase 04071976041219420407 --disautologin --password Mekir9 --username esmalif --debianflavor gnome-desktop 

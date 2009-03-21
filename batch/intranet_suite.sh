#!/bin/bash

cd /home/esmalif/cooperation/CVS/branch/0.9/0.9_code_cleaning

sudo ./cooperation-iws.py -c --createdirectories  --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --keyblang fr --modulesfile templates/System/gateway_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Wordpress --directory /media/partage-dev/tmp/zaa22 --host gateway --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-gw-intranet-0.8.0.iso --disautologin --silent --disautologin


sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/System/administrationModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/zaa4 --host administration --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-administration-intranet-0.8.0.iso --disautologin
 


sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/System/communicationsModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/zaa42a1 --host com --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-communications-intranet-0.8.0.iso --silent --disautologin



sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/System/Kolab_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/zaa71a2 --host mail --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-groupware-intranet-0.8.0.iso --disautologin --silent 



sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/System/cmsModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/zaa22a3 --host cms --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-cms-intranet-0.8.0.iso --disautologin
 
 


sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/System/dataManagementModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/zaa31a5 --host data --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-datamanagement-intranet-0.8.0.iso --disautologin
 


sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/System/devModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/zaa21a6 --host dev --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-dev-intranet-0.8.0.iso --disautologin
 


sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/System/eLearningModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Wordpress --directory /media/partage-dev/tmp/zaa21a7 --host elearning --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-elearning-intranet-0.8.0.iso --disautologin
 


sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/System/socialWriterModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/zdaa31a8 --host social --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-socialwriter-intranet-0.8.0.iso --disautologin
 

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/System/gforge_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/zcaa31a8 --host forge --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-gforge-intranet-0.8.0.iso --disautologin
 

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/System/proxy_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/zbaa31a8 --host proxy --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-proxy-intranet-0.8.0.iso --disautologin
 
sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/ubuntu-8.04.1-update-090310.iso --modulesfile templates/System/hosting_intranet --webappmirror http://localhost:81/depot --debmirror http://ciwsdev.cooperation-iws.intra:3142/fr.archive.ubuntu.com/ubuntu/ --debmirrornonfree http://ciwsdev.cooperation-iws.intra:3142/packages.medibuntu.org/ --debmirrorsecurity http://ciwsdev.cooperation-iws.intra:3142/fr.archive.ubuntu.com/ubuntu/ --cms Joomla --directory /media/partage-dev/tmp/zaaa31a9 --host hosting --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-hosting-intranet-0.8.0.iso --disautologin
 



sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/pfSense-1.2-LiveCD-Installer.iso --modulesfile templates/System/pfsense_intranet --outputisoname cooperation-iws-pfsense-1.2-0.7.0.iso --pfsense --directory /media/partage-dev/tmp/zaa21a12




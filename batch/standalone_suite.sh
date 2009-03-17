#!/bin/bash

cd /home/esmalif/cooperation/CVS/branch/0.9/0.9_code_cleaning

rm -r /media/partage-dev/tmp/*

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/personalModulesList --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/azaa10a4 --host personal --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-personal-standalone-0.9.0.iso
 

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/cmsModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/azaa10a3 --host cms --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-cms-standalone-0.9.0.iso
 
 

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/dataManagementModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/azba10a5 --host data --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-datamanagement-standalone-0.9.0.iso
 

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/devModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/azaa10a6 --host dev --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-dev-standalone-0.9.0.iso
 

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/eLearningModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/azca10a7 --host elearning --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-elearning-standalone-0.9.0.iso
 


sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/socialWriterModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/azaa10a8 --host social --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-socialwriter-standalone-0.9.0.iso



sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/netbookModulesList --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/azaa10a9 --host netbook --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-netbook-standalone-0.9.0.iso --debmirrorsecurity http://localhost:3142/ubuntu_main/ --silent --disautologin

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/lenny-gnome-090313.iso --modulesfile templates/nomadWorkerModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/azaa10a10 --host nomad --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-nomad-worker-standalone-0.9.0.iso --debmirrorsecurity http://localhost:3142/ubuntu_main/ --silent 

./home/esmalif/cooperation/CVS/branch/0.9/0.9_code_cleaning/batch/intranet_suite.sh

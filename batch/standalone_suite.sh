#!/bin/bash

cd /home/esmalif/cooperation/CVS/branch/0.9/0.9_code_cleaning


#sudo ./cooperation-iws.py -c --createdirectories --isofile /home/esmalif/cooperation/ISO/debian_lenny_xfce_desktop.iso --modulesfile templates/personalModulesList --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/zaa10a4 --host personal --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-personal-standalone-0.9.0.iso
 
#cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto
sudo ./cooperation-iws.py -c --createdirectories --isofile /home/esmalif/cooperation/ISO/debian_lenny_xfce_desktop.iso --modulesfile templates/cmsModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/zaa10a3 --host cms --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-cms-standalone-0.9.0.iso
 
 
#cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto
sudo ./cooperation-iws.py -c --createdirectories --isofile /home/esmalif/cooperation/ISO/debian_lenny_xfce_desktop.iso --modulesfile templates/dataManagementModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/zaa10a5 --host data --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-datamanagement-standalone-0.9.0.iso
 
#cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto
#sudo ./cooperation-iws.py -c --createdirectories --isofile /home/esmalif/cooperation/ISO/debian_lenny_xfce_desktop.iso --modulesfile templates/devModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/zaa10a6 --host dev --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-dev-standalone-0.9.0.iso
 
#cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto
#sudo ./cooperation-iws.py -c --createdirectories --isofile /home/esmalif/cooperation/ISO/debian_lenny_xfce_desktop.iso --modulesfile templates/eLearningModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/zaa10a7 --host elearning --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-elearning-standalone-0.9.0.iso
 
#cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto

#sudo ./cooperation-iws.py -c --createdirectories --isofile /home/esmalif/cooperation/ISO/debian_lenny_xfce_desktop.iso --modulesfile templates/socialWriterModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/zaa10a8 --host social --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-socialwriter-standalone-0.9.0.iso

#cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto

#sudo ./cooperation-iws.py -c --createdirectories --isofile /home/esmalif/cooperation/ISO/debian_lenny_xfce_desktop.iso --modulesfile templates/netbookModulesList --webappmirror http://localhost:81/depot --debmirror http://localhost:3141/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:3141/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:3141/security.debian.org/ --cms Joomla --directory /media/partage-dev/tmp/zaa10a9 --host netbook --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-netbook-standalone-0.9.0.iso --debmirrorsecurity http://localhost:3142/ubuntu_main/ --silent --disautologin


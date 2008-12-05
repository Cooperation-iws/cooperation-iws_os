#!/bin/bash

cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto


sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/administrationModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --debmirrorsecurity http://localhost:3142/ubuntu_main/ --cms Joomla --directory /media/partage-dev/tmp/zaa4 --host administration --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-administration-intranet-0.7.0.iso
 
cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/communicationsModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --debmirrorsecurity http://localhost:3142/ubuntu_main/ --cms Joomla --directory /media/partage-dev/tmp/zaa21a1 --host com --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-communications-intranet-0.7.0.iso

cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/Kolab --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --debmirrorsecurity http://localhost:3142/ubuntu_main/ --cms Joomla --directory /media/partage-dev/tmp/zaa21a2 --host mail --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-groupware-intranet-0.7.0.iso

cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/cmsModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --debmirrorsecurity http://localhost:3142/ubuntu_main/ --cms Joomla --directory /media/partage-dev/tmp/zaa21a3 --host cms --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-cms-intranet-0.7.0.iso
 
 
cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/dataManagementModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --debmirrorsecurity http://localhost:3142/ubuntu_main/ --cms Joomla --directory /media/partage-dev/tmp/zaa21a5 --host data --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-datamanagement-intranet-0.7.0.iso
 
cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/devModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --debmirrorsecurity http://localhost:3142/ubuntu_main/ --cms Joomla --directory /media/partage-dev/tmp/zaa21a6 --host dev --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-dev-intranet-0.7.0.iso
 
cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/eLearningModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --debmirrorsecurity http://localhost:3142/ubuntu_main/ --cms Wordpress --directory /media/partage-dev/tmp/zaa21a7 --host elearning --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-elearning-intranet-0.7.0.iso
 
cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/socialWriterModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --debmirrorsecurity http://localhost:3142/ubuntu_main/ --cms Joomla --directory /media/partage-dev/tmp/zaa21a8 --host social --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-socialwriter-intranet-0.7.0.iso
 

cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/pfSense-1.2-LiveCD-Installer.iso --modulesfile templates/pfsense --outputisoname cooperation-iws-pfsense-1.2-0.7.0.iso --pfsense --directory /media/partage-dev/tmp/zaa21a12


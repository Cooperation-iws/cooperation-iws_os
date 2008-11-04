#!/bin/bash

cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_fully_auto


sudo ./cooperation-iws.py -c --createdirectories --isofile /media/cooperation-core/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/personalModulesList --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Wordpress --directory /media/partage-dev/0a4 --host personal --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname ciws-personal-standalone-0.5.2.iso
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/cooperation-core/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/cmsModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Joomla --directory /media/partage-dev/0a3 --host cms --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname ciws-cms-standalone-0.5.2.iso
 
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/cooperation-core/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/dataManagementModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Joomla --directory /media/partage-dev/0a5 --host data --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname ciws-datamanagement-standalone-0.5.2.iso
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/cooperation-core/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/devModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Joomla --directory /media/partage-dev/0a6 --host dev --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname ciws-dev-standalone-0.5.2.iso
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/cooperation-core/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/eLearningModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Wordpress --directory /media/partage-dev/0a7 --host elearning --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname ciws-elearning-standalone-0.5.2.iso
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/cooperation-core/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/socialWriterModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Wordpress --directory /media/partage-dev/0a8 --host social --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname ciws-socialwriter-standalone-0.5.2.iso
 

#!/bin/bash

cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_fully_auto


sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-sauv/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/administrationModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Wordpress --directory /media/partage-dev/1a4 --host administration --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname ciws-administration-intranet-0.5.2.iso
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-sauv/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/communicationsModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Joomla --directory /media/partage-dev/1a1 --host com --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname ciws-communications-intranet-0.5.2.iso

cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-sauv/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/groupwareModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Joomla --directory /media/partage-dev/1a2 --host mail --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname ciws-groupware-intranet-0.5.2.iso

cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-sauv/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/cmsModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Joomla --directory /media/partage-dev/1a3 --host cms --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname ciws-cms-intranet-0.5.2.iso
 
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-sauv/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/dataManagementModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Joomla --directory /media/partage-dev/1a5 --host data --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname ciws-datamanagement-intranet-0.5.2.iso
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-sauv/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/devModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Joomla --directory /media/partage-dev/1a6 --host dev --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname ciws-dev-intranet-0.5.2.iso
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-sauv/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/eLearningModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Wordpress --directory /media/partage-dev/1a7 --host elearning --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname ciws-elearning-intranet-0.5.2.iso
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-sauv/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/socialWriterModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Joomla --directory /media/partage-dev/1a8 --host social --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname ciws-socialwriter-intranet-0.5.2.iso
 

#!/bin/bash

cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_cmd_line

./cooperation-iws.py -c --createdirectories --isofile /media/cooperation-core/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/groupwareModulesList_intranet --webappmirror http://localhost:81/mirror --cms Joomla --directory /media/partage-dev/0a1 --host mail --password cooperation --username ciwsadmin --artwork ciwsGnome
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_cmd_line

./cooperation-iws.py -c --createdirectories --isofile /media/cooperation-core/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/administrationModulesList_intranet --webappmirror http://localhost:81/mirror --cms Joomla --directory /media/partage-dev/0a2--host administration --password cooperation --username ciwsadmin --artwork ciwsGnome
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_cmd_line

./cooperation-iws.py -c --createdirectories --isofile /media/cooperation-core/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/cmsModulesList_intranet --webappmirror http://localhost:81/mirror --cms Joomla --directory /media/partage-dev/0a3 --host cms --password cooperation --username ciwsadmin --artwork ciwsGnome
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_cmd_line

./cooperation-iws.py -c --createdirectories --isofile /media/cooperation-core/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/communicationsModulesList_intranet --webappmirror http://localhost:81/mirror --cms Joomla --directory /media/partage-dev/0a4 --host com --password cooperation --username ciwsadmin --artwork ciwsGnome
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_cmd_line

./cooperation-iws.py -c --createdirectories --isofile /media/cooperation-core/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/dataManagementModulesList_intranet --webappmirror http://localhost:81/mirror --cms Joomla --directory /media/partage-dev/0a5 --host data --password cooperation --username ciwsadmin --artwork ciwsGnome
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_cmd_line

./cooperation-iws.py -c --createdirectories --isofile /media/cooperation-core/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/devModulesList_intranet --webappmirror http://localhost:81/mirror --cms Joomla --directory /media/partage-dev/0a6 --host dev --password cooperation --username ciwsadmin --artwork ciwsGnome
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_cmd_line

./cooperation-iws.py -c --createdirectories --isofile /media/cooperation-core/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/eLearningModulesList_intranet --webappmirror http://localhost:81/mirror --cms Wordpress --directory /media/partage-dev/0a7 --host elearning --password cooperation --username ciwsadmin --artwork ciwsGnome
 
cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_cmd_line

./cooperation-iws.py -c --createdirectories --isofile /media/cooperation-core/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/socialWriterModulesList_intranet --webappmirror http://localhost:81/mirror --cms Wordpress --directory /media/partage-dev/0a8 --host social --password cooperation --username ciwsadmin --artwork ciwsGnome
 

#!/bin/bash
cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto


#sudo ./cooperation-iws.py -c --createdirectories --modulesfile templates/dev --webappmirror http://localhost:81/depot --debmirror http://ftp.fr.debian.org/debian/ --debmirrornonfree http://mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://security.debian.org/ --directory /media/partage-dev/tmp/1a21 --host ciws-client  --outputisoname ciws-test-0.5.2.iso --isofile /media/partage-dev/ISO/64studio-live_2.0_i386.iso
 
#--isofile /media/partage-sauv/ISO/xubuntu-8.04.1-desktop-i386.iso
# --keyblang fr --debianlive
# --debmirror http://localhost:81/deb/mirror/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:81/deb/mirror/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:81/deb/mirror/security.debian.org/

#sudo ./cooperation-iws.py -c --createdirectories --modulesfile templates/empty --debmirror http://localhost:81/deb/mirror/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:81/deb/mirror/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:81/deb/mirror/security.debian.org/ --directory /media/partage-dev/tmp/1a45 --host ciws-client  --outputisoname ciws-test-0.5.2.iso --keyblang fr --debianlive --webconverger --webappmirror http://localhost:81/depot --ostype Client --silent
#sudo ./cooperation-iws.py -c --createdirectories --modulesfile templates/empty --debmirror  http://ftp.fr.debian.org/debian/ --debmirrornonfree http://mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://security.debian.org/ --directory /media/partage-dev/tmp/1a26 --host ciws-client  --outputisoname ciws-test-0.5.2.iso --keyblang fr --debianlive --webconverger --webappmirror http://localhost:81/depot --ostype Client
#sudo ./cooperation-iws.py -c --createdirectories --modulesfile templates/empty --debmirror http://localhost:81/deb/mirror/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:81/deb/mirror/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:81/deb/mirror/security.debian.org/ --directory /media/partage-dev/tmp/1a54 --host ciws-client  --outputisoname ciws-test-0.5.2.iso --keyblang fr --debianlive --webappmirror http://localhost:81/depot --silent --encryption aes256 --encryptionpassphrase 01234567890123456789 --ostype Client
#sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/empty --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --directory /media/partage-dev/tmp/1a52 --host ciws-client --password cooperation --username ciwsadmin --silent --outputisoname ciws-xubuntu-8.04.1-client-0.5.2.iso --disautologin --encryption aes256 --encryptionpassphrase 01234567890123456789 --ostype Client
#sudo ./cooperation-iws.py -c --createdirectories --modulesfile templates/empty --debmirror http://localhost:81/deb/mirror/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:81/deb/mirror/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:81/deb/mirror/security.debian.org/ --directory /media/partage-dev/tmp/9a6 --host ciws-client  --outputisoname ciws-test-0.5.2.iso --keyblang fr  --isofile /media/partage-dev/ISO/debian-live-lenny-i386-xfce-desktop.iso --webappmirror http://localhost:81/depot --encryption aes256 --encryptionpassphrase 0123456789012345678901 --ostype Client --silent
#sudo ./cooperation-iws.py -c --createdirectories --modulesfile templates/empty --debmirror http://localhost:81/deb/mirror/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:81/deb/mirror/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:81/deb/mirror/security.debian.org/ --directory /media/partage-dev/tmp/10b40 --host ciws-client  --outputisoname ciws-test-0.5.2.iso --keyblang fr --debianlive --webappmirror http://localhost:81/depot --encryption aes256 --encryptionpassphrase 01234567890123456789 --ostype Client --silent 

#cd /media/cooperation-core/cooperation/CVS/branch/Pro/ciws_fully_auto

#sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/communicationsModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Joomla --directory /media/partage-dev/tmp/1a1 --host com --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname ciws-communications-intranet-0.5.2.iso

#sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/Kolab --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Joomla --directory /media/partage-dev/tmp/0a26 --host kolab --artwork ciwsGnome --outputisoname ciws-communications-intranet-0.5.2.iso --password cooperation 

#sudo ./cooperation-iws.py -c --createdirectories --modulesfile templates/empty --debmirror http://localhost:81/deb/mirror/ftp.fr.debian.org/debian/ --debmirrornonfree http://localhost:81/deb/mirror/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity http://localhost:81/deb/mirror/security.debian.org/ --directory /media/partage-dev/tmp/10b30 --host ciws-client  --outputisoname ciws-test-0.5.2.iso --keyblang fr --webappmirror http://localhost:81/depot --encryption aes256 --encryptionpassphrase 01234567890123456789 --ostype Client --silent --isofile /media/partage-dev/tmp/10b29/debian_lenny_barebone.iso
#sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/Obm --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Joomla --directory /media/partage-dev/tmp/0a23 --host kolab --artwork ciwsGnome --outputisoname ciws-communications-intranet-0.5.2.iso --password cooperation 
#sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/dev --webappmirror http://localhost:81/depot --debmirror http://localhost:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://localhost:81/deb/mirror/packages.medibuntu.org/ --cms Joomla --directory /media/partage-dev/tmp/1a01 --host kolab --artwork ciwsGnome --outputisoname ciws-communications-intranet-0.5.2.iso --password cooperation 
#sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.04.1-desktop-i386.iso --modulesfile templates/eLearningModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --cms Joomla --directory /media/partage-dev/tmp/0a9 --host cms --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname ciws-cms-intranet-0.5.2.iso --debmirrorsecurity http://localhost:3142/ubuntu_main/
#sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/dataManagementModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --cms Joomla --directory /media/partage-dev/tmp/0a40 --host data --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname ciws-cms-intranet-0.5.2.iso --debmirrorsecurity http://localhost:3142/ubuntu_main/ --silent
#sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/personalModulesList --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --cms Joomla --directory /media/partage-dev/tmp/0a51 --host perso --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname ciws-cms-intranet-0.5.2.iso --debmirrorsecurity http://localhost:3142/ubuntu_main/ --silent
#sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/netbookModulesList --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --cms Joomla --directory /media/partage-dev/tmp/0b1 --host netbook --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname ciws-cms-intranet-0.5.2.iso --debmirrorsecurity http://localhost:3142/ubuntu_main/ --silent --disautologin

cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto

#sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/pfSense-1.2-LiveCD-Installer.iso --modulesfile templates/pfsense --outputisoname cooperation-iws-pfsense-1.2-0.7.0.iso --pfsense --directory /media/partage-dev/tmp/0101a16
#sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/netbookModulesList --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --debmirrorsecurity http://localhost:3142/ubuntu_main/ --cms Joomla --directory /media/partage-dev/tmp/91a10 --host netbook --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-netbook-standalone-0.7.0.iso --debmirrorsecurity http://localhost:3142/ubuntu_main/ --disautologin

#sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/Kolab --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --debmirrorsecurity http://localhost:3142/ubuntu_main/ --cms Joomla --directory /media/partage-dev/tmp/a21a2 --host mail --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-groupware-intranet-0.7.0.iso



#sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/administrationModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --debmirrorsecurity http://localhost:3142/ubuntu_main/ --cms Joomla --directory /media/partage-dev/tmp/zab4 --host administration --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-administration-intranet-0.7.0.iso

cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/cmsModulesList_intranet --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --debmirrorsecurity http://localhost:3142/ubuntu_main/ --cms Joomla --directory /media/partage-dev/tmp/zad21a3 --host cms --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-cms-intranet-0.7.0.iso
 
cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto
#sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/dataManagementModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --debmirrorsecurity http://localhost:3142/ubuntu_main/ --cms Joomla --directory /media/partage-dev/tmp/zac10a5 --host data --password cooperation --username ciwsadmin --artwork ciwsGnome --silent --outputisoname cooperation-iws-datamanagement-standalone-0.7.0.iso
 
#cd /home/esmalif/cooperation/CVS/branch/Pro/ciws_fully_auto
#sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/xubuntu-8.10-desktop-i386.iso --modulesfile templates/devModulesList_standalone --webappmirror http://localhost:81/depot --debmirror http://localhost:3142/ubuntu_main/ --debmirrornonfree http://localhost:3142/ubuntu_multimedia/ --debmirrorsecurity http://localhost:3142/ubuntu_main/ --cms Joomla --directory /media/partage-dev/tmp/zac10a6 --host dev --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-dev-standalone-0.7.0.iso

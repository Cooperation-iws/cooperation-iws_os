#!/bin/bash


RMOD_ENGINE=1.0
RMOD_CATEGORY='Software'
RMOD_SUBCATEGORY='Lampp_core'
RMOD_NAME='Lampp'
RMOD_AUTHOR='Oliv'
RMOD_VERSION=0.2
RMOD_DESCRIPTION='Installs'
RMOD_RUN_IN_CHROOT=True
RMOD_UPDATE_URL='http://reconstructor.aperantis.com/update/modules/'



SCRIPT_DIRECTORY="/tmp"
echo $SCRIPT_DIRECTORY > /tmp/script-path
WWW_DIRECTORY="/var/www"
echo $WWW_DIRECTORY > /tmp/web-path
DL_DIR="/tmp/web_install"
mkdir $DL_DIR
echo $DL_DIR > /tmp/web_install-path
BIN_MYSQL="/usr/bin/mysql"
echo $BIN_MYSQL > /tmp/mysql-path
PLUGIN_DIR="${SCRIPTS_DIR}/modules"
LAMPP_DIRECTORY="/var"
echo $LAMPP_DIRECTORY > /tmp/lampp-dir
CHROOT_DIRECTORY="root"
echo $CHROOT_DIRECTORY > /tmp/chroot-dir
URL_FREE="http://cooperation.gensys.free.fr/mirroir/v0.5"
URL_BERLIOS1="http://download.berlios.de/ciws"
URL_BERLIOS2="http://download2.berlios.de/ciws"
VERSION="0.5.2"
CASPER_PATH=$(cat /tmp/casper_path)

if [ "$(echo $LANG | grep 'fr')" ]; then
LANG_UI="FR"
else
LANG_UI="EN"
fi
echo $LANG_UI > /tmp/lang-wui

APACHE=$(cat /tmp/apache)


function ADD_USER()
{
export LC_ALL=C
mkdir /etc/skel/.gconf
mkdir /etc/skel/.gconfd
mkdir -p /etc/skel/Bureau
sleep 2
#useradd -d /home/liveusb -m liveusb -s /bin/bash -p U6aMy0wojraho
useradd -d /home/liveusb -m liveusb -s /bin/bash -p U6aMy0wojraho -g root -u 1000
echo -e "root ALL=(ALL) ALL" | tee /etc/sudoers
echo -e "%admin ALL=(ALL) ALL" | tee -a /etc/sudoers
echo -e "liveusb ALL=(ALL) ALL" | tee -a /etc/sudoers
sleep 2
}
#ADD_USER

if [ "$(echo "${CASPER_PATH}" | awk  '{print $1}')" == "casper" ]; then
echo "
deb http://ftp.crihan.fr/ubuntu/ hardy restricted main universe multiverse
deb http://ftp.crihan.fr/ubuntu/ hardy-updates restricted main universe multiverse
deb http://ftp.crihan.fr/ubuntu/ hardy-security restricted main universe multiverse
" > /etc/apt/sources.list
else
echo "
deb http://ftp.fr.debian.org/debian/ lenny main contrib non-free
deb-src http://ftp.fr.debian.org/debian/ lenny main contrib 
# Dépôts Multimédia
# Dépôts Multimédia
deb http://www.debian-multimedia.org lenny main non-free
deb-src http://www.debian-multimedia.org lenny main 
#Dépots sécurité
deb http://security.debian.org/ lenny/updates main contrib non-free
deb-src http://security.debian.org/ lenny/updates main contrib 
" > /etc/apt/sources.list
export DEBIAN_FRONTEND="dialog"
fi
apt-get update
apt-get install --yes --force-yes build-essential 

if [ "$(echo "${APACHE}" | awk  '{print $1}')" == "A" ]; then

killall -9 httpd
killall -9 apache2
killall -9 mysqld
killall -9 mysqld_safe


apt-get install --yes --force-yes  apache2 apache2-doc apache2-mpm-prefork apache2-utils apache2.2-common mysql-server php5 libapache2-mod-php5 php5-mysql phpmyadmin php-pear php5-cli php5-gd php5-xsl php5-curl libapache2-mod-python php-pear libphp-adodb libexpat1 ssl-cert php5-imagick php5-imap php5-mcrypt php5-memcache php5-mhash php5-ming php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-cli imagemagick





echo "I: config apache"
echo "EnableSendfile off" >> /etc/apache2/apache2.conf
sed -i -e "31s/#/AddType image\/svg+xml .svg/" /etc/apache2/mods-available/mime.conf
sed -i -e "8s/None/All/" /etc/apache2/sites-available/default
sed -i -e "12s/None/All/" /etc/apache2/sites-available/default


echo "I: config phpmyadmin"
rm /etc/apache2/conf.d/phpmyadmin.conf
ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf.d/phpmyadmin.conf 

echo "I: config php"
sed -i "270s/16/128/" /etc/php5/apache2/php.ini
sed -i "565s/2/512/" /etc/php5/apache2/php.ini
sed -i -e  "s/post_max_size = 8M/post_max_size = 32M/" /etc/php5/apache2/php.ini
/etc/init.d/apache2 restart
/etc/init.d/mysql start

mkdir $WWW_DIRECTORY/admin/
rm $WWW_DIRECTORY/index.html

echo "I: config Cooperation-iws wui"
cd $DL_DIR
wget $URL_FREE/cooperation-wui-0.5.0.tar.gz
tar -xzvf cooperation-wui-0.5.0.tar.gz
mv cooperation-wui-0.5.0 cooperation-wui
sed -i "s/{version}/$VERSION/" $DL_DIR/cooperation-wui/cooperation-wui.footer.php
cp -Rf $DL_DIR/cooperation-wui/cooperation.header.jpg $WWW_DIRECTORY/.
cp -Rf $DL_DIR/cooperation-wui/cooperation.header.jpg $WWW_DIRECTORY/admin/.
cp -Rf $DL_DIR/cooperation-wui/cooperation-wui.footer.php $WWW_DIRECTORY/.
cp -Rf $DL_DIR/cooperation-wui/cooperation-wui.footer.php $WWW_DIRECTORY/admin/.
cp -Rf $DL_DIR/cooperation-wui/cooperation-wui.header.php $WWW_DIRECTORY/.
cp -Rf $DL_DIR/cooperation-wui/cooperation-wui.header.php $WWW_DIRECTORY/admin/.
cp -Rf $DL_DIR/cooperation-wui/cooperation-wui.layout.css $WWW_DIRECTORY/.
cp -Rf $DL_DIR/cooperation-wui/cooperation-wui.layout.css $WWW_DIRECTORY/admin/.


echo ""> $WWW_DIRECTORY/cooperation-wui.frame.php

#ADMIN

cp -Rf $WWW_DIRECTORY/cooperation-wui.frame.php $WWW_DIRECTORY/admin/.

fi



echo "I: config rc.local"
echo "#!/bin/sh

" > /etc/rc.local

echo "I: create persistent directory"
mkdir $LAMPP_DIRECTORY/share/
mkdir $LAMPP_DIRECTORY/share/lampp
mkdir $LAMPP_DIRECTORY/share/etc

echo "I: post install script creation"
echo "#!/bin/bash
WWW_DIRECTORY=\"/var/www\"
" > $LAMPP_DIRECTORY/share/lampp/config_post_install.sh





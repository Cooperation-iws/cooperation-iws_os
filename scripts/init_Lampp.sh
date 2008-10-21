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



WWW_DIRECTORY=$(cat /tmp/web-path)
DL_DIR=$(cat /tmp/web_install-path)
BIN_MYSQL=$(cat /tmp/mysql-path)
LAMPP_DIRECTORY=$(cat /tmp/script-path)
DISPLAY=127.0.0.1:5.0
LAMPP_DIRECTORY=$(cat /tmp/lampp-dir)

APACHE=$(cat /tmp/apache)
MIRROIR=$(cat /tmp/mirroir)
URL_FREE=$(cat /tmp/url_mirroir)
CASPER_PATH=$(cat /tmp/casper_path)



if [ "$(echo "${APACHE}" | awk  '{print $1}')" == "A" ]; then

killall -9 httpd
killall -9 apache2
killall -9 mysqld
killall -9 mysqld_safe


apt-get install --yes --force-yes apache2 apache2-doc apache2-mpm-prefork apache2-utils apache2.2-common mysql-server php5 libapache2-mod-php5 php5-mysql phpmyadmin php-pear php5-cli php5-gd php5-xsl php5-curl libapache2-mod-python php-pear libphp-adodb libexpat1 ssl-cert php5-imagick php5-imap php5-mcrypt php5-memcache php5-mhash php5-ming php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-cli imagemagick


#Debian utils
apt-get install --yes --force-yes unzip

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



echo "<?xml version=\"1.0\"?>
<items>" > $WWW_DIRECTORY/cooperation-wui.xml
echo "<?xml version=\"1.0\"?>
<items>" > $WWW_DIRECTORY/cooperation-wui-fr.xml

#ADMIN

cp -Rf $WWW_DIRECTORY/cooperation-wui.xml $WWW_DIRECTORY/admin/.
cp -Rf $WWW_DIRECTORY/cooperation-wui-fr.xml $WWW_DIRECTORY/admin/.

fi






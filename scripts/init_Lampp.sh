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

URL_FREE=$(cat /tmp/url_mirroir)
CASPER_PATH=$(cat /tmp/casper_path)

SILENT=$(cat /tmp/silent)
SILENT_INSTALL=$(cat /tmp/silent_install)

if [ "$(echo $SILENT | awk  '{print $1}')" != "" ]; then
export DEBIAN_FRONTEND=noninteractive
fi


if [ "$(echo "${APACHE}" | awk  '{print $1}')" == "A" ]; then



killall -9 httpd
killall -9 apache2
killall -9 mysqld
killall -9 mysqld_safe


#cancel inhibition for mysql
if [ "$(echo $SILENT_INSTALL | awk  '{print $1}')" != "" ]; then

mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.mysql
cp /usr/sbin/policy-rc.d.silent_install /usr/sbin/policy-rc.d
fi

apt-get install --yes --force-yes mysql-server



apt-get install --yes --force-yes apache2 apache2-doc apache2-mpm-prefork apache2-utils apache2.2-common php5 libapache2-mod-php5 php5-mysql phpmyadmin php-pear php5-cli php5-gd php5-xsl php5-curl libapache2-mod-python php-pear libphp-adodb libexpat1 ssl-cert php5-imagick php5-imap php5-mcrypt php5-memcache php5-mhash php5-ming php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-cli imagemagick


#Debian utils
apt-get install --yes --force-yes unzip
/etc/init.d/apache2 stop
/etc/init.d/mysql stop

echo "I: config apache"
echo "EnableSendfile off" >> /etc/apache2/apache2.conf
sed -i "31s/#/AddType image\/svg+xml .svg/" /etc/apache2/mods-available/mime.conf
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/sites-available/default
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/sites-available/default-ssl


echo "I: config phpmyadmin"
rm /etc/apache2/conf.d/phpmyadmin.conf
ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf.d/phpmyadmin.conf 

echo "I: config php"
sed -i "270s/16/128/" /etc/php5/apache2/php.ini
sed -i "565s/2/512/" /etc/php5/apache2/php.ini
sed -i -e  "s/post_max_size = 8M/post_max_size = 32M/" /etc/php5/apache2/php.ini

sed -i "51s/#/default-character-set=utf8/" /etc/mysql/my.cnf


mkdir $WWW_DIRECTORY/admin/
rm $WWW_DIRECTORY/index.html



mv /var/lib/mysql $LAMPP_DIRECTORY/var/lib
ln -s $LAMPP_DIRECTORY/var/lib/mysql /var/lib/mysql

mv /var/lib/mysql-cluster $LAMPP_DIRECTORY/var/lib
ln -s $LAMPP_DIRECTORY/var/lib/mysql-cluster /var/lib/mysql-cluster

mv /var/lib/phpmyadmin $LAMPP_DIRECTORY/var/lib
ln -s $LAMPP_DIRECTORY/var/lib/phpmyadmin /var/lib/phpmyadmin


mv /etc/apache2 $LAMPP_DIRECTORY/etc

ln -s $LAMPP_DIRECTORY/etc/apache2 /etc/apache2

mv /etc/php5 $LAMPP_DIRECTORY/etc

ln -s $LAMPP_DIRECTORY/etc/php5 /etc/php5

mv /etc/mysql $LAMPP_DIRECTORY/etc

ln -s $LAMPP_DIRECTORY/etc/mysql /etc/mysql

mkdir $LAMPP_DIRECTORY/server/var


mv /var/www $LAMPP_DIRECTORY/server/var

ln -s $LAMPP_DIRECTORY/server/var/www /var/www



echo "I: config Cooperation-iws wui"

mv /tmp/cooperation-wui.xml $WWW_DIRECTORY/cooperation-wui.xml
mv /tmp/cooperation-wui-fr.xml  $WWW_DIRECTORY/cooperation-wui-fr.xml

#ADMIN

mv /tmp/admin_cooperation-wui.xml $WWW_DIRECTORY/admin/cooperation-wui.xml
mv /tmp/admin_cooperation-wui-fr.xml  $WWW_DIRECTORY/admin/cooperation-wui-fr.xml



/etc/init.d/mysql start
if [ "$(echo $SILENT_INSTALL | awk  '{print $1}')" != "" ]; then

mv /usr/sbin/policy-rc.d.mysql /usr/sbin/policy-rc.d 
else
/etc/init.d/apache2 start
fi

fi






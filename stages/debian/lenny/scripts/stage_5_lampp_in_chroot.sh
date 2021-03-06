#!/bin/bash
#
#STAGE 5 SETUP LAMPP SERVER - WORK IF MODULES HAVE RMOD_REQ_APACHE=true
#
#
#


RMOD_ENGINE=1.0
RMOD_CATEGORY='Software'
RMOD_SUBCATEGORY='Lampp_core'
RMOD_NAME='Lampp'
RMOD_AUTHOR='Oliv'
RMOD_VERSION=0.2
RMOD_DESCRIPTION='Installs'
RMOD_RUN_IN_CHROOT=True



. /tmp/scripts_params

echo "I:SETUP LAMPP SERVER"


export DEBIAN_FRONTEND=noninteractive





killall -9 httpd
killall -9 apache2
killall -9 mysqld
killall -9 mysqld_safe


#cancel inhibition for mysql


mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.mysql
cp /usr/sbin/policy-rc.d.silent_install /usr/sbin/policy-rc.d


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



/etc/init.d/mysql start

mv /usr/sbin/policy-rc.d.mysql /usr/sbin/policy-rc.d 









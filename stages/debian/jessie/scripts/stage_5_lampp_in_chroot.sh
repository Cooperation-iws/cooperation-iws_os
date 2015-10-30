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



apt-get install --yes --force-yes apache2 apache2-doc apache2-utils php5 libapache2-mod-php5 php5-mysql php-pear php5-cli php5-gd php5-xsl php5-curl libapache2-mod-python libexpat1 ssl-cert php5-imagick php5-imap php5-mcrypt php5-memcache php5-mhash php5-recode php5-sqlite php5-tidy php5-xmlrpc php5-xsl imagemagick dh-php5


#Debian utils
apt-get install --yes --force-yes unzip
/etc/init.d/apache2 stop


echo "I: config apache"
echo "EnableSendfile off" >> /etc/apache2/apache2.conf
sed -i "31s/#/AddType image\/svg+xml .svg/" /etc/apache2/mods-available/mime.conf

sed -i "245G" /etc/apache2/mods-available/mime.conf
sed -i "245G" /etc/apache2/mods-available/mime.conf
sed -i "246s/^/AddType text\/html .asp/" /etc/apache2/mods-available/mime.conf
sed -i "247s/^/AddType text\/html .jsp/" /etc/apache2/mods-available/mime.conf



sed -i "s/var\/www\/html/var\/www/" /etc/apache2/sites-available/000-default.conf
sed -i "s/var\/www\/html/var\/www/" /etc/apache2/sites-available/default-ssl.conf




echo "I: config php"

sed -i -e  "s/post_max_size = 8M/post_max_size = 200M/" /etc/php5/apache2/php.ini
sed -i -e  "s/upload_max_filesize = 2M/upload_max_filesize = 200M/" /etc/php5/apache2/php.ini




echo "I: config directory"

mkdir $WWW_DIRECTORY/admin/
rm $WWW_DIRECTORY/index.html





mv /etc/apache2 $LAMPP_DIRECTORY/etc

ln -s $LAMPP_DIRECTORY/etc/apache2 /etc/apache2

mv /etc/php5 $LAMPP_DIRECTORY/etc

ln -s $LAMPP_DIRECTORY/etc/php5 /etc/php5


mkdir $LAMPP_DIRECTORY/server/var


mv /var/www $LAMPP_DIRECTORY/server/var

ln -s $LAMPP_DIRECTORY/server/var/www /var/www











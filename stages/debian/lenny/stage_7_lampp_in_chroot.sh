#!/bin/bash
#
#STAGE 7 FINISH SETUP LAMPP SERVER - WORK IF MODULES HAVE REQ_APACHE=true
#
#
#



. /tmp/scripts_params

. /tmp/app_params


#ENDING XML WEB DESC FILES
cd /tmp/
for langxml in $(ls ciws-lang-*.xml)
do

lang_1=$(echo $langxml | cut -d'-' -f3)
lang=$(echo $lang_1 | cut -d'.' -f1)


echo "</items>" >> $WWW_DIRECTORY/cooperation-wui-$lang.xml

echo "</items>" >> $WWW_DIRECTORY/admin/cooperation-wui-$lang.xml

done


#CONFIGURING DEFAULT SITE FOR APACHE2
echo "I: Configuring Apache2 for domains"

if [ "$domain" ] && [ -d /etc/bind ] && [ "$(echo "$DEB_DIST" | awk  '{print $1}')" == "lenny" ]; then
sed -i "3G" /etc/apache2/sites-available/default
sed -i "3G" /etc/apache2/sites-available/default
sed -i "3G" /etc/apache2/sites-available/default
sed -i "3s/^/ServerName $domain/" /etc/apache2/sites-available/default
sed -i "4s/^/ServerAlias wwi.$domain/" /etc/apache2/sites-available/default
sed -i "5s/^/ServerAlias $HOSTNAME.$domain/" /etc/apache2/sites-available/default

sed -i "4G" /etc/apache2/sites-available/default-ssl
sed -i "4G" /etc/apache2/sites-available/default-ssl
sed -i "4G" /etc/apache2/sites-available/default-ssl
sed -i "4s/^/ServerName $domain/" /etc/apache2/sites-available/default-ssl
sed -i "5s/^/ServerAlias wwi.$domain/" /etc/apache2/sites-available/default-ssl
sed -i "6s/^/ServerAlias $HOSTNAME.$domain/" /etc/apache2/sites-available/default-ssl
/etc/init.d/apache2 restart
fi


echo "I: End of Customization"

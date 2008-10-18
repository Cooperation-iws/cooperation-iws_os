#!/bin/bash
RMOD_ENGINE=1.0
RMOD_CATEGORY='Software'
RMOD_SUBCATEGORY='Servers'
RMOD_NAME='Search Engine'
RMOD_AUTHOR='Oliv'
RMOD_VERSION=0.1
RMOD_DESCRIPTION='Web crawler'
RMOD_RUN_IN_CHROOT=True
RMOD_UPDATE_URL='http://cooperation-iws.gensys-net.eu/update/modules/'
RMOD_REQ_APACHE=True

WWW_DIRECTORY=$(cat /tmp/web-path)
DL_DIR=$(cat /tmp/web_install-path)
BIN_MYSQL=$(cat /tmp/mysql-path)
SCRIPT_DIRECTORY=$(cat /tmp/script-path)
DISPLAY=127.0.0.1:5.0
LAMPP_DIRECTORY=$(cat /tmp/lampp-dir)
LANG_UI=$(cat /tmp/lang-wui)
APACHE=$(cat /tmp/apache)

#TEMP
MIRROIR=$(cat /tmp/mirroir)
URL_FREE=$(cat /tmp/url_mirroir)

INSTALL=$(cat /tmp/def_install)

#VARIABLES
#MYSQL PASSWORD
SPHIDER_MYSQL_PWD="SPHIDER_MYSQL_PWD"
ADMIN_PWD="cooperation"
#_______________________________________________________________________________________________
#__________________________________________LANGFR______________________________________________


function LANGFR

{
MESS_NAME="Entrez le nom de l'installation "
MESS_HOW_MANY="Combien de" 
MESS_DO_YOU_WANT="voulez vous installez ?"
MESS_URL="Quelle est l'url à partir de laquelle vous avez effectuée l'installation des applications web?"
}
#_______________________________________________________________________________________________
#__________________________________________FIN_LANGFR___________________________________________

#_______________________________________________________________________________________________
#__________________________________________LANGEN______________________________________________


function LANGEN

{
MESS_NAME="Enter the name of the install "
MESS_HOW_MANY="How many"
MESS_DO_YOU_WANT="do you want to install ?"
MESS_URL="What's the url from where you install web applications ?"

}
#_______________________________________________________________________________________________
#__________________________________________FIN_LANGEN___________________________________________


#_______________________________________________________________________________________________
#__________________________________________CHOICE_LANG___________________________________________

function CHOICE_LANG
{
if [ "$(echo "${LANG_UI}" | awk  '{print $1}')" == "FR" ]; then
LANGFR

else
LANGEN

fi
}
#_______________________________________________________________________________________________
#__________________________________________FIN_CHOICE_LANG______________________________________


#_______________________________________________________________________________________________
#________________________________________CHOOSE_PARAMETERS_GUI______________________________________

function CHOOSE_PARAMETERS_GUI
{
NOM_SPHIDER="Sphider"

}
#_______________________________________________________________________________________________
#________________________________________FIN_CHOOSE_PARAMETERS_GUI______________________________


#_______________________________________________________________________________________________
#________________________________________INSTALL________________________________________________


function INSTALL
{

##SPHIDER
cd $DL_DIR
sed -i "s/{version}/$VERSION/" /tmp/cooperation-wui/cooperation-wui.footer.php
cp -r /tmp/cooperation-wui/* /var/www/.

echo "create database ${NOM_SPHIDER};
grant all on ${NOM_SPHIDER}.* to ${NOM_SPHIDER}@localhost identified by '$SPHIDER_MYSQL_PWD';
flush privileges;" > SPHIDER_db.sql

$BIN_MYSQL -u root < SPHIDER_db.sql mysql
rm SPHIDER_db.sql

$BIN_MYSQL -u root ${NOM_SPHIDER} < $WWW_DIRECTORY/admin/$NOM_SPHIDER/sql/tables.sql 

$BIN_MYSQL -u root < /var/www/cooperation-iws/cooperation-iws.sql
echo "grant all on \`cooperation-iws\`.* to \`cooperation-iws\`@localhost identified by 'CIWS_MYSQL_PWD';
flush privileges;" > CIWS_db.sql
$BIN_MYSQL -u root < CIWS_db.sql mysql

apt-get install --assume-yes --force-yes poppler-utils catdoc pstotext zip


chown -R www-data $WWW_DIRECTORY/


echo "-----------------Cooperation-iws----------------------------"
echo "---Configure Sphider to automatically index the portal------"
echo "[Y/n]"
read r1 < /dev/tty
if [ "$(echo $r1 | awk  '{print $1}')" != "n" ]; then
echo "18 */23 * * * www-data php $WWW_DIRECTORY/admin/$NOM_SPHIDER/admin/spider.php -u http://localhost/ -r -d 5" > /etc/cron.d/sphider_crawl
sudo chmod +x /etc/cron.d/sphider_crawl
fi


}

#_______________________________________________________________________________________________
#________________________________________FIN_INSTALL____________________________________________

#_______________________________________________________________________________________________
#________________________________________CREATE_WUI_____________________________________________

function CREATE_WUI
{
echo "
<item>
<item_category>$RMOD_DESCRIPTION</item_category>
<item_url>/admin/$NOM_SPHIDER/admin/admin.php</item_url>
<item_name>$RMOD_NAME</item_name>
<item_desc>$RMOD_VERBOSE</item_desc>
<item_admin_url>/$MOD_NAME</item_admin_url>
</item>
" >> $WWW_DIRECTORY/admin/cooperation-wui.xml
}
#_______________________________________________________________________________________________
#________________________________________FIN_CREATE_WUI_________________________________________

#_______________________________________________________________________________________________
#________________________________________CREATE_INSTALL_SCRIPT__________________________________


function CREATE_INSTALL_SCRIPT
{

echo "

#Sphider
" >> $LAMPP_DIRECTORY/share/lampp/config_post_install.sh

}

#_______________________________________________________________________________________________
#________________________________________FIN_CREATE_INSTALL_SCRIPT______________________________
if [ "$(echo "${APACHE}" | awk  '{print $1}')" == "A" ]; then
echo "I: Install Sphider"
CHOICE_LANG
CHOOSE_PARAMETERS_GUI
INSTALL
CREATE_WUI
CREATE_INSTALL_SCRIPT
echo "I: End of install Sphider"
fi

#!/bin/bash
WWW_DIRECTORY=$(cat /tmp/web-path)
DL_DIR=$(cat /tmp/web_install-path)
BIN_MYSQL=$(cat /tmp/mysql-path)
LAMPP_DIRECTORY=$(cat /tmp/script-path)
DISPLAY=127.0.0.1:5.0
LAMPP_DIRECTORY=$(cat /tmp/lampp-dir)

APACHE=$(cat /tmp/apache)

URL_CIWS_DEPOT=$(cat /tmp/url_mirroir)
CASPER_PATH=$(cat /tmp/casper_path_updated)
OS_TYPE=$(cat /tmp/os_type)
TMPUSER=$(cat /tmp/tmp_user)
SILENT=$(cat /tmp/silent)
DEB_DIST=$(cat /tmp/deb_dist)

. /tmp/app_params


if [ "$(echo $SILENT | awk  '{print $1}')" == "" ]; then
	echo "I: config post install script"
	echo "

	echo \"
	----------------Cooperation-iws----------------
	-----Press Enter / Appuyer sur entrée----------\"
	read ok < /dev/tty
	" >> $LAMPP_DIRECTORY/share/lampp/config_post_install.sh

	chmod +x $LAMPP_DIRECTORY/share/lampp/config_post_install.sh
fi




if [ "$(echo "${APACHE}" | awk  '{print $1}')" == "A" ]; then
cd /tmp/
for langxml in $(ls ciws-lang-*.xml)
do

lang_1=$(echo $langxml | cut -d'-' -f3)
lang=$(echo $lang_1 | cut -d'.' -f1)


echo "</items>" >> $WWW_DIRECTORY/cooperation-wui-$lang.xml

echo "</items>" >> $WWW_DIRECTORY/admin/cooperation-wui-$lang.xml

done
fi


echo "I: End of Customization"

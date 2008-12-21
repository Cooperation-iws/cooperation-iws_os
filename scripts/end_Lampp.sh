#!/bin/bash
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



echo "</items>" >> $WWW_DIRECTORY/cooperation-wui.xml

echo "</items>" >> $WWW_DIRECTORY/admin/cooperation-wui.xml
echo "</items>" >> $WWW_DIRECTORY/cooperation-wui-fr.xml

echo "</items>" >> $WWW_DIRECTORY/admin/cooperation-wui-fr.xml


fi


echo "I: End of Customization"

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
if [ "$(echo $SILENT | awk  '{print $1}')" != "" ]; then
. /tmp/app_params
fi

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


if [ "$(echo "${OS_TYPE}" | awk  '{print $1}')" == "Server" ]; then
echo "I: configuring $CASPER_PATH"
if [ "$(echo "${CASPER_PATH}" | awk  '{print $1}')" == "casper" ]; then
if [ "$(echo "$DEB_DIST" | awk  '{print $1}')" == "intrepid" ]; then
sed -i -e "406s/\/home/\/var/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "413s/\/home/\/var/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "10s/home-rw/ciws-rw/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "12s/home-sn/ciws-sn/" /usr/share/initramfs-tools/scripts/$CASPER_PATH

else
sed -i -e "405s/\/home/\/var/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "412s/\/home/\/var/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "13s/home-rw/ciws-rw/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "15s/home-sn/ciws-sn/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
fi
else
sed -i -e "904s/\/home/\/var/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "1210s/\/home/\/var/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "1218s/\/home/\/var/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "14s/home-rw/ciws-rw/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "16s/home-sn/ciws-sn/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
fi
fi


echo "I: Delete examples directory on the desktop"
CHERCHE='chroot \/root install -o $USERNAME -g $USERNAME -d \/home\/$USERNAME\/Desktop\/'
sed -i "s/^[ \t]*${CHERCHE}/#${CHERCHE}/" \
	/usr/share/initramfs-tools/scripts/$CASPER_PATH-bottom/10adduser
#Désactiver alias Examples sur bureau
CHERCHE='mv \/root\/home\/$USERNAME\/Examples \/root\/home\/$USERNAME\/Desktop\/'
sed -i "s/^[ \t]*${CHERCHE}/#${CHERCHE}/" \
	/usr/share/initramfs-tools/scripts/$CASPER_PATH-bottom/10adduser


if [ "$(echo "${APACHE}" | awk  '{print $1}')" == "A" ]; then


echo "I: displacing /etc directories"

mv /etc/apache2 /var/share/etc/

ln -s /var/share/etc/apache2 /etc/apache2

mv /etc/php5 /var/share/etc/

ln -s /var/share/etc/php5 /etc/php5

mv /etc/mysql /var/share/etc/

ln -s /var/share/etc/mysql /etc/mysql

echo "</items>" >> $WWW_DIRECTORY/cooperation-wui.xml

echo "</items>" >> $WWW_DIRECTORY/admin/cooperation-wui.xml
echo "</items>" >> $WWW_DIRECTORY/cooperation-wui-fr.xml

echo "</items>" >> $WWW_DIRECTORY/admin/cooperation-wui-fr.xml


fi


echo "I: End of Customization"

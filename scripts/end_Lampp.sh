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

echo "I: config post install script"
echo "

echo \"
----------------Cooperation-iws----------------
-----Press Enter / Appuyer sur entrée----------\"
read ok < /dev/tty
" >> $LAMPP_DIRECTORY/share/lampp/config_post_install.sh

chmod +x $LAMPP_DIRECTORY/share/lampp/config_post_install.sh

if [ "$(echo "${OS_TYPE}" | awk  '{print $1}')" == "Server" ]; then
echo "I: configuring $CASPER_PATH"
if [ "$(echo "${CASPER_PATH}" | awk  '{print $1}')" == "casper" ]; then
sed -i -e "405s/\/home/\/var/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "412s/\/home/\/var/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "13s/home-rw/ciws-rw/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "15s/home-sn/ciws-sn/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
else
sed -i -e "1210s/\/home/\/var/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "1218s/\/home/\/var/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "14s/home-rw/ciws-rw/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "16s/home-sn/ciws-sn/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
fi
fi

echo "#!/bin/sh

PREREQ=\"\"
DESCRIPTION=\"Copying Ciws persistence...\"
. /scripts/$CASPER_PATH-functions

prereqs()
{
       echo \"\$PREREQ\"
}

case \$1 in
# get pre-requisites
prereqs)
       prereqs
       exit 0
       ;;
esac

if [ ! -d /root/var/lib ]; then
log_begin_msg \"\$DESCRIPTION\"
echo \"
rm /etc/rc0.d/*$CASPER_PATH* 
rm /etc/rc6.d/*$CASPER_PATH*
\" >> /root/etc/ciws/share/etc/rc.ciws

cp -a /root/etc/ciws/* /root/var/.
log_end_msg	
fi
" > /usr/share/initramfs-tools/scripts/$CASPER_PATH-bottom/00cpvar

chmod +x /usr/share/initramfs-tools/scripts/$CASPER_PATH-bottom/00cpvar



if [ "$(echo "${APACHE}" | awk  '{print $1}')" == "A" ]; then


echo "I: displacing /etc directories"

mv /etc/apache2 /var/share/etc/

ln -s /var/share/etc/apache2 /etc/apache2

mv /etc/php5 /var/share/etc/

ln -s /var/share/etc/php5 /etc/php5

mv /etc/mysql /var/share/etc/

ln -s /var/share/etc/mysql /etc/mysql

fi


echo "I: End of Customization"

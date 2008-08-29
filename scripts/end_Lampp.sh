#!/bin/bash
WWW_DIRECTORY=$(cat /tmp/web-path)
DL_DIR=$(cat /tmp/web_install-path)
BIN_MYSQL=$(cat /tmp/mysql-path)
LAMPP_DIRECTORY=$(cat /tmp/script-path)
DISPLAY=127.0.0.1:5.0
LAMPP_DIRECTORY=$(cat /tmp/lampp-dir)



echo "I: config post install script"
echo "

echo \"
----------------Cooperation-iws----------------
-----Press Enter / Appuyer sur entrée----------\"
read ok < /dev/tty
" >> $LAMPP_DIRECTORY/share/lampp/config_post_install.sh

chmod +x $LAMPP_DIRECTORY/share/lampp/config_post_install.sh





echo "I: displacing /etc directories"

mv /etc/apache2 /var/share/etc/

ln -s /var/share/etc/apache2 /etc/apache2

mv /etc/php5 /var/share/etc/

ln -s /var/share/etc/php5 /etc/php5

echo "I: configuring casper"
sed -i -e "405s/\/home/\/var/" /usr/share/initramfs-tools/scripts/casper
sed -i -e "412s/\/home/\/var/" /usr/share/initramfs-tools/scripts/casper
sed -i -e "13s/home-rw/ciws-rw/" /usr/share/initramfs-tools/scripts/casper
sed -i -e "15s/home-sn/ciws-sn/" /usr/share/initramfs-tools/scripts/casper

echo "I: removing prompt at shutdown"
if [ "$(ls -l /etc/rc0.d/*casper*)" ]; then
rm /etc/rc0.d/*casper* 
rm /etc/rc6.d/*casper*
fi


echo "#!/bin/sh

PREREQ=\"\"
DESCRIPTION=\"Copying Ciws persistence...\"
. /scripts/casper-functions

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

cp -a /root/etc/ciws/* /root/var/.
log_end_msg	
fi
" > /usr/share/initramfs-tools/scripts/casper-bottom/00cpvar

chmod +x /usr/share/initramfs-tools/scripts/casper-bottom/00cpvar



echo "I: End of Customization"

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

APACHE=$(cat /tmp/apache)
LIVEUSER=$(cat /tmp/user)
TMPUSER=$(cat /tmp/tmp_user)
OS_TYPE=$(cat /tmp/os_type)

SILENT=$(cat /tmp/silent)
if [ "$(echo $SILENT | awk  '{print $1}')" != "" ]; then
. /tmp/app_params
fi



echo "I: making initramfs"
KERNEL=$(ls /lib/modules) 
KERNEL=(${KERNEL[@]})
NB_KERNEL=$(ls /lib/modules | wc -l)
NB_KERNEL=$(expr $NB_KERNEL-1)
if [ "$(cat /tmp/kernel)" ]; then
KERNEL[0]="$(cat /tmp/kernel)"
NB_KERNEL=0
fi
echo "building ${KERNEL[$NB_KERNEL]}"
mkinitramfs -o /initrd.gz ${KERNEL[$NB_KERNEL]}
rm /vmlinuz
cp /boot/vmlinuz-${KERNEL[$NB_KERNEL]} /vmlinuz


echo "I: Removing chroot user"
function REMOVE_USER()
{

#faire mirroir dans /etc/skel/.
cp -r /home/$TMPUSER/* /etc/skel/.

sleep 2
#virer admin et liveusb de /etc/sudoers
#cat /etc/sudoers | sed '/%admin/d' | tee /etc/sudoers
echo -e "root ALL=(ALL) ALL" | tee /etc/sudoers
#supprimer user 
userdel -r $TMPUSER
}
REMOVE_USER
chmod -R 777 /etc/skel
rm -r /home/*

if [ "$(echo "${APACHE}" | awk  '{print $1}')" == "A" ]; then


echo "I: Securing Lampp Server"
if [ "$(echo $SILENT | awk  '{print $1}')" != "" ]; then
	if [ "$(echo $secure_mysql | awk  '{print $1}')" != "n" ]; then
		mysql_secure_installation
	fi
	if [ "$(echo $secure_admin | awk  '{print $1}')" != "n" ]; then

		mkdir /var/private
		cd /var/private/	
	

		echo "
		AuthName \"Ciws user\"                 
		AuthType Basic    
		AuthUserFile /var/private/lampp.users
		require valid-user                    
		" >  /var/www/admin/.htaccess
		htpasswd -cm -b lampp.users admin $apache_admin_pwd
		chmod a+r /var/www/admin/.htaccess
		echo "CIWS: Password protection active. Please use 'admin' as user name!"
	fi
else
	echo "
	---------------Cooperation-iws----------------------------
	-------Do you want to secure your mysql server ?----------
	--------Curently there is no root password (none)---------
	[Y/n]:
	"
	read secure_mysql < /dev/tty

	if [ "$(echo $secure_mysql | awk  '{print $1}')" != "n" ]; then
		mysql_secure_installation
	fi

	echo "
	---------------Cooperation-iws----------------------------
	-------Do you want to secure your admin pages ?----------
	--------Curently there is no password (none)---------
	[Y/n]:
	"
	read secure_admin < /dev/tty

	if [ "$(echo $secure_admin | awk  '{print $1}')" != "n" ]; then

		mkdir /var/private
		cd /var/private/	
	

		echo "
		AuthName \"Ciws user\"                 
		AuthType Basic    
		AuthUserFile /var/private/lampp.users
		require valid-user                    
		" >  /var/www/admin/.htaccess
		htpasswd -cm lampp.users admin
		chmod a+r /var/www/admin/.htaccess
		echo "CIWS: Password protection active. Please use 'admin' as user name!"
	fi
fi
fi
echo "I: shuting down servers"
#shutdown script
killall -9 apache2
killall -9 mysqld
killall -9 mysqld_safe
/etc/init.d/webmin stop 1>&2 2>/dev/null
/etc/init.d/postfix stop 1>&2 2>/dev/null
/etc/init.d/dovecot stop 1>&2 2>/dev/null
/etc/init.d/mailscanner stop 1>&2 2>/dev/null
/etc/init.d/clamav-daemon stop 1>&2 2>/dev/null
/etc/init.d/open-xchange-admin stop 1>&2 2>/dev/null
/etc/init.d/open-xchange-groupware stop 1>&2 2>/dev/null
/etc/init.d/dhcp3-server stop 1>&2 2>/dev/null
/etc/init.d/tftpd-hpa stop 1>&2 2>/dev/null
/etc/init.d/portmap stop 1>&2 2>/dev/null
/etc/init.d/nfs-common stop 1>&2 2>/dev/null
/etc/init.d/nfs-kernel-server stop 1>&2 2>/dev/null
/etc/init.d/syslog-ng stop 1>&2 2>/dev/null
killall -9 ruby 1>&2 2>/dev/null
/kolab/bin/openpkg rc all stop

echo "I: config rc.local"

echo "#!/bin/bash

" > /var/share/etc/rc.ciws > /dev/null 2>&1 

chmod +x /var/share/etc/rc.ciws > /dev/null 2>&1 

echo "
/var/share/etc/rc.ciws
exit 0

" >> /etc/rc.local
chmod +x /etc/rc.local


echo "I: empty temporary directory"
rm -r /tmp/*
rm /var/cache/apt/archives/* > /dev/null 2>&1 
rm /var/cache/apt/archives/partial/* > /dev/null 2>&1 

if [ "$(echo "${OS_TYPE}" | awk  '{print $1}')" == "Server" ]; then

echo "I: config persistent directory"


mkdir /etc/ciws
cp -a  /var/* /etc/ciws/.
fi

if [ "$(echo $SILENT | awk  '{print $1}')" == "" ]; then

echo "----------------Cooperation-iws----------------
------------Press Enter / Appuyer sur entrée----------"
read ok < /dev/tty
fi

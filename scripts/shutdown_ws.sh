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
BIN_MYSQL=$(cat /tmp/mysql-path)
APACHE=$(cat /tmp/apache)
LIVEUSER=$(cat /tmp/user)
TMPUSER=$(cat /tmp/tmp_user)

SILENT=$(cat /tmp/silent)
if [ "$(echo $SILENT | awk  '{print $1}')" != "" ]; then
. /tmp/app_params
fi

echo "I: configuring sources.list"
mv /etc/apt/sources.list.orig /etc/apt/sources.list

if [ "$(echo "${OS_TYPE}" | awk  '{print $1}')" == "Server" ]; then
echo "I: configuring $CASPER_PATH"
if [ "$(echo "${CASPER_PATH}" | awk  '{print $1}')" == "casper" ]; then
if [ "$(echo "$DEB_DIST" | awk  '{print $1}')" == "intrepid" ]; then
sed -i -e "406s/\/home/\/opt\/ciws/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "413s/\/home/\/opt\/ciws/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "10s/home-rw/ciws-rw/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "12s/home-sn/ciws-sn/" /usr/share/initramfs-tools/scripts/$CASPER_PATH

else
sed -i -e "405s/\/home/\/opt\/ciws/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "412s/\/home/\/opt\/ciws/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "13s/home-rw/ciws-rw/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "15s/home-sn/ciws-sn/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
fi
else
#sed -i -e "904s/\/home/\/var/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "1275s/\/home/\/opt\/ciws/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "1284s/\/home/\/opt\/ciws/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
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


echo "I: configuring persistence"

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
" > /usr/share/initramfs-tools/scripts/$CASPER_PATH-bottom/001cpvar
chmod +x /usr/share/initramfs-tools/scripts/$CASPER_PATH-bottom/001cpvar




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
		echo "UPDATE mysql.user SET Password=PASSWORD('$mysql_root_password') WHERE User='root';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host!='localhost';
FLUSH PRIVILEGES;
" > /tmp/mysql_secure.sql
$BIN_MYSQL -u root < /tmp/mysql_secure.sql


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
/kolab/bin/openpkg rc all stop 1>&2 2>/dev/null
/etc/init.d/openoffice stop 1>&2 2>/dev/null
/opt/lps-4.0.6/Server/tomcat-5.0.24/bin/shutdown.sh 1>&2 2>/dev/null
/etc/init.d/red5 stop 1>&2 2>/dev/null

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

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
CASPER_PATH=$(cat /tmp/casper_path_updated)
OS_TYPE=$(cat /tmp/os_type)
BIN_MYSQL=$(cat /tmp/mysql-path)
APACHE=$(cat /tmp/apache)
LIVEUSER=$(cat /tmp/user)
TMPUSER=$(cat /tmp/tmp_user)
DEB_DIST=$(cat /tmp/deb_dist)

SILENT=$(cat /tmp/silent)
SILENT_INSTALL=$(cat /tmp/silent_install)

. /tmp/app_params

HOSTNAME=$(cat /tmp/hostname)

if [ "$(echo $SILENT_INSTALL | awk  '{print $1}')" != "" ]; then

rm /usr/sbin/policy-rc.d
mv /usr/sbin/policy-rc.d.silent_install /usr/sbin/policy-rc.d
fi

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
sed -i "135G" /usr/share/initramfs-tools/scripts/live
sed -i "135G" /usr/share/initramfs-tools/scripts/live
sed -i '136s/^/KBD="${ARGUMENT#*=}"/' /usr/share/initramfs-tools/scripts/live
sed -i '137s/^/export KBD/' /usr/share/initramfs-tools/scripts/live

#sed -i -e "904s/\/home/\/var/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "961s/\/home/\/opt\/ciws/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "1297s/\/home/\/opt\/ciws/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "1306s/\/home/\/opt\/ciws/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "14s/home-rw/ciws-rw/" /usr/share/initramfs-tools/scripts/$CASPER_PATH
sed -i -e "16s/home-sn/ciws-sn/" /usr/share/initramfs-tools/scripts/$CASPER_PATH

sed -i "137G" /usr/share/initramfs-tools/scripts/live
sed -i "137G" /usr/share/initramfs-tools/scripts/live
sed -i '138s/^/LOCALE="${KBD}"/' /usr/share/initramfs-tools/scripts/live
sed -i '139s/^/export LOCALE/' /usr/share/initramfs-tools/scripts/live
#temporary hack to delete lang2local warning bug
sed -i '189s/^/#/' /usr/share/initramfs-tools/scripts/live


				
fi
elif [ "$(echo "${CASPER_PATH}" | awk  '{print $1}')" == "live" ]; then
sed -i "135G" /usr/share/initramfs-tools/scripts/live
sed -i "135G" /usr/share/initramfs-tools/scripts/live
sed -i '136s/^/KBD="${ARGUMENT#*=}"/' /usr/share/initramfs-tools/scripts/live
sed -i '137s/^/export KBD/' /usr/share/initramfs-tools/scripts/live
sed -i "137G" /usr/share/initramfs-tools/scripts/live
sed -i "137G" /usr/share/initramfs-tools/scripts/live
sed -i '138s/^/LOCALE="${KBD}"/' /usr/share/initramfs-tools/scripts/live
sed -i '139s/^/export LOCALE/' /usr/share/initramfs-tools/scripts/live
#temporary hack to delete lang2local warning bug
sed -i '189s/^/#/' /usr/share/initramfs-tools/scripts/live

fi

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

if [ ! -d /root/$LAMPP_DIRECTORY/var/lib ] ; then
log_begin_msg \"\$DESCRIPTION\"
echo \"
rm /etc/rc0.d/*$CASPER_PATH* 
rm /etc/rc6.d/*$CASPER_PATH*
\" >> /root/etc/ciws/etc/rc.ciws

echo \"Copying Ciws persistence... please wait\"
cp -a /root/etc/ciws/* /root/opt/ciws/.
log_end_msg	
fi
" > /usr/share/initramfs-tools/scripts/$CASPER_PATH-bottom/001cpvar
chmod +x /usr/share/initramfs-tools/scripts/$CASPER_PATH-bottom/001cpvar

echo "I:Configuring sources.list"
if [ "$(echo "$DEB_DIST" | awk  '{print $1}')" != "lenny" ] && [ "$(echo "$DEB_DIST" | awk  '{print $1}')" != "etch" ]; then
echo "
deb http://archive.ubuntu.com/ubuntu/ $DEB_DIST restricted main universe multiverse
deb http://archive.ubuntu.com/ubuntu/ $DEB_DIST-updates restricted main universe multiverse
deb http://security.ubuntu.com/ubuntu/ $DEB_DIST-security restricted main universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ $DEB_DIST restricted main universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ $DEB_DIST-updates restricted main universe multiverse
deb-src http://security.ubuntu.com/ubuntu/ $DEB_DIST-security restricted main universe multiverse

deb http://packages.medibuntu.org/ $DEB_DIST free non-free
" > /etc/apt/sources.list
else
echo "
deb ftp://ftp.debian.org/debian/ $DEB_DIST main contrib non-free
deb-src ftp://ftp.debian.org/debian/ $DEB_DIST main contrib 
#Multimedia
deb http://www.debian-multimedia.org $DEB_DIST main 
deb-src http://www.debian-multimedia.org $DEB_DIST main 
#Security
deb http://security.debian.org/ $DEB_DIST/updates main contrib non-free
deb-src http://security.debian.org/ $DEB_DIST/updates main contrib 
" > /etc/apt/sources.list
export DEBIAN_FRONTEND="dialog"
fi
if [ "$(echo "$DEBNONFREE_MIRROR_PATH" | grep 'medibuntu.org')" ]; then
wget -q http://fr.packages.medibuntu.org/medibuntu-key.gpg -O- | sudo apt-key add -
fi
rm /etc/apt/sources.list.d/*
echo "" > /var/log/dpkg.log
#apt-get update

#Removing start-up inhibition
#rm /usr/sbin/policy-rc.d
#mv /usr/sbin/policy-rc.d.orig /usr/sbin/policy-rc.d


echo "I: making initramfs"

if [ "$(cat /tmp/kernel)" ]; then
kernel="$(cat /tmp/kernel)"
fi
echo "building kernel $kernel"
mkinitramfs -o /initrd.gz $kernel
rm /vmlinuz
cp /boot/vmlinuz-$kernel /vmlinuz


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
/etc/init.d/mongrel_cluster stop 1>&2 2>/dev/null
killall -9 mongrel_rails 1>&2 2>/dev/null
/etc/init.d/postgresql-8.3 stop 1>&2 2>/dev/null
/etc/init.d/exim4 stop 1>&2 2>/dev/null
/etc/init.d/mailman stop 1>&2 2>/dev/null
/etc/init.d/tigase stop 1>&2 2>/dev/null
/etc/init.d/libresource stop 1>&2 2>/dev/null
/etc/init.d/tomcat5.5 stop 1>&2 2>/dev/null

echo "I: config rc.local"

echo "#!/bin/bash

" > $LAMPP_DIRECTORY/etc/rc.ciws > /dev/null 2>&1 

chmod +x $LAMPP_DIRECTORY/etc/rc.ciws > /dev/null 2>&1 

echo "
$LAMPP_DIRECTORY/etc/rc.ciws
exit 0

" >> /etc/rc.local
chmod +x /etc/rc.local


echo "I: empty temporary directory"
rm -r /tmp/*
rm /var/cache/apt/archives/* > /dev/null 2>&1 
rm /var/cache/apt/archives/partial/* > /dev/null 2>&1 

if [ "$(echo "${OS_TYPE}" | awk  '{print $1}')" == "Server" ]; then

echo "I: displacing directories"


mv /etc/cron.d $LAMPP_DIRECTORY/etc
ln -s $LAMPP_DIRECTORY/etc/cron.d /etc/cron.d


if [ "$(echo "${OS_TYPE}" | awk  '{print $1}')" == "Server" ]; then
echo "I: configuring home persistence"
mv /home /opt/ciws
ln -s /opt/ciws/home /home
fi

echo "I: config persistent directory"


mkdir /etc/ciws
cp -a /opt/ciws/* /etc/ciws/.
fi

if [ "$(echo $SILENT | awk  '{print $1}')" == "" ]; then

echo "----------------Cooperation-iws----------------
------------Press Enter / Appuyer sur entrée----------"
read ok < /dev/tty
fi

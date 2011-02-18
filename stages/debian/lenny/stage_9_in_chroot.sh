#!/bin/bash
#
#STAGE 9 SHUTTING DOWN ALL SERVER - CLOSING ACTION FROM STAGE 3
#
#
#


. /tmp/scripts_params

. /tmp/app_params




#RESTORING START DAEMON PARAMETER
rm /usr/sbin/policy-rc.d
mv /usr/sbin/policy-rc.d.silent_install /usr/sbin/policy-rc.d


#FIXING RESOLV CONF FOR LENNY
if [ "$DEB_DIST" == "lenny" ] ; then
rm /etc/resolv.conf
ln -s /etc/resolvconf/run/resolv.conf /etc/resolv.conf
fi

#CONFIGURING PERSISTENCE
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


#CONFIGURING SOURCES.LIST
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
rm /etc/apt/sources.list.d/*
echo "" > /var/log/dpkg.log

#MAKE INITRD
echo "I: make initramfs"

if [ -e /tmp/kernel ]; then
kernel="$(cat /tmp/kernel)"
fi
echo "building kernel $kernel"
mkinitramfs -o /initrd.gz $kernel
rm /vmlinuz
cp /boot/vmlinuz-$kernel /vmlinuz



if [ "${APACHE}"  == "A" ]; then

echo "I: Securing Lampp Server"

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
mv /root /opt/ciws
ln -s /opt/ciws/root /root
fi

echo "I: configuring log persistence"
mv /var/log /opt/ciws/var
ln -s /opt/ciws/var/log /var/log

echo "I: config persistent directory"
mkdir /etc/ciws
cp -a /opt/ciws/* /etc/ciws/.
fi



#!/bin/bash
#
#STAGE 9 SHUTTING DOWN ALL SERVER - CLOSING ACTION FROM STAGE 3
#
#
#


. /tmp/scripts_params

. /tmp/app_params


echo "I:CREATING PACKAGES LIST"

dpkg -l | cut -d' ' -f3 > /opt/ciws/usr/lib/packages.list


echo "I:SHUTTING DOWN ALL SERVER"

#ENDING XML WEB DESC FILES
cd /tmp/
for langxml in $(ls ciws-lang-*.xml)
do

lang_1=$(echo $langxml | cut -d'-' -f3)
lang=$(echo $lang_1 | cut -d'.' -f1)

echo "</items>" >> $LAMPP_DIRECTORY/etc/ciws-content/cooperation-wui-$lang.xml
chmod 755 $LAMPP_DIRECTORY/etc/ciws-content/cooperation-wui-$lang.xml
done


#RESTORING START DAEMON PARAMETER
rm /usr/sbin/policy-rc.d
mv /usr/sbin/policy-rc.d.silent_install /usr/sbin/policy-rc.d


#FIX WHEEZY BASH FOR SUDO AND X
if [ "$DEB_DIST" == "wheezy" ] || [ "$DEB_DIST" == "squeeze" ] ; then

echo "
if [ ! \"\$(cat /home/$LIVEUSER/.bashrc | grep 'xhost +local:root')\" ] ; then
echo \"
xhost +local:root > /dev/null
\" >> /home/$LIVEUSER/.bashrc
fi
" >> /etc/rc.local
fi


#CONFIGURING PERSISTENCE
echo "I: configuring persistence"

echo "#!/bin/sh

if [ ! -d /$LAMPP_DIRECTORY/var/lib ] ; then
echo \"\$DESCRIPTION\"


echo \"Copying Ciws persistence... please wait\"
cp -a /etc/ciws/* /opt/ciws/.
	
fi
" > /lib/live/config/0001-cpvar
chmod +x /lib/live/config/0001-cpvar


echo "I: Setting up standalone connection parameter"

if [ "$keep_local_apt_parameters" != "y" ]; then

mv /etc/apt/sources.list.internet /etc/apt/sources.list

fi

rm /etc/apt/sources.list.d/*
echo "" > /var/log/dpkg.log

#MAKE INITRD
echo "I: make initramfs"

if [ -e /tmp/kernel ]; then
kernel="$(cat /tmp/kernel)"
fi
echo "building kernel $kernel"

/usr/sbin/update-initramfs.orig.initramfs-tools -k all -t -c
rm /initrd.img
ln -s /boot/initrd.img-$kernel /initrd.img
rm /vmlinuz
cp /boot/vmlinuz-$kernel /vmlinuz



if [ "${APACHE}"  == "A" ]; then

echo "I: Securing Lampp Server"

	
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


echo "I: proceeding to last customizations"
#shutdown script
chmod +x /opt/ciws/share/lampp/config_post_install.sh
/opt/ciws/share/lampp/config_post_install.sh
rm -r /opt/ciws/share


echo "I: shuting down servers"
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
[[ -e /var/log/exim4/paniclog ]] && rm /var/log/exim4/paniclog
/etc/init.d/exim4 stop 1>&2 2>/dev/null
[[ -e /var/log/exim4/paniclog ]] && rm /var/log/exim4/paniclog
/etc/init.d/mailman stop 1>&2 2>/dev/null
/etc/init.d/tigase stop 1>&2 2>/dev/null
/etc/init.d/libresource stop 1>&2 2>/dev/null
/etc/init.d/tomcat5.5 stop 1>&2 2>/dev/null
/etc/init.d/dbus stop 1>&2 2>/dev/null
/etc/init.d/binfmt-support stop 1>&2 2>/dev/null

echo "I: config rc.local"


echo "

$LAMPP_DIRECTORY/etc/rc.ciws
exit 0

" >> /etc/rc.local
chmod +x /etc/rc.local


echo "I: empty temporary directory"
rm -r /tmp/*
rm /var/cache/apt/archives/* > /dev/null 2>&1 
rm /var/cache/apt/archives/partial/* > /dev/null 2>&1 


echo "I: displacing directories"
mv /etc/cron.d $LAMPP_DIRECTORY/etc
ln -s $LAMPP_DIRECTORY/etc/cron.d /etc/cron.d

echo "I: configuring apt persistence"
mv /etc/apt $LAMPP_DIRECTORY/etc
ln -s $LAMPP_DIRECTORY/etc/apt /etc/apt

echo "I: configuring home persistence"
mv /home /opt/ciws
ln -s /opt/ciws/home /home
mv /root /opt/ciws
ln -s /opt/ciws/root /root

echo "I: configuring log persistence"
mv /var/log /opt/ciws/var
ln -s /opt/ciws/var/log /var/log

echo "I: config persistent directory"
mkdir /etc/ciws
cp -a /opt/ciws/* /etc/ciws/.



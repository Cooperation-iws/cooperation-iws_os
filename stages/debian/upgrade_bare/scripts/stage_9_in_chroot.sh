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


#RESTORING START DAEMON PARAMETER
rm /usr/sbin/policy-rc.d
mv /usr/sbin/policy-rc.d.silent_install /usr/sbin/policy-rc.d







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

update-initramfs -k all -t -u
rm /initrd.img
ln -s /boot/initrd.img-$kernel /initrd.img
rm /vmlinuz
cp /boot/vmlinuz-$kernel /vmlinuz







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


echo "I: empty temporary directory"
rm -r /tmp/*
rm /var/cache/apt/archives/* > /dev/null 2>&1 
rm /var/cache/apt/archives/partial/* > /dev/null 2>&1 




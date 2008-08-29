#!/bin/bash

WWW_DIRECTORY="/var/www"



echo "I: making initramfs"
KERNEL=$(ls /lib/modules) 
KERNEL=(${KERNEL[@]})
NB_KERNEL=$(ls /lib/modules | wc -l)
NB_KERNEL=$(expr $NB_KERNEL-1)
mkinitramfs -o /initrd.gz ${KERNEL[$NB_KERNEL]}


echo "I: Configuring cooperation-iws wui"

echo "
<hr width=\"20%\">
<a href=\"/admin\">Admin</a><br>
</center>

" >> $WWW_DIRECTORY/cooperation-wui.frame.php

echo "<?php include('cooperation-wui.footer.php'); ?>" >> $WWW_DIRECTORY/cooperation-wui.frame.php

mv $WWW_DIRECTORY/cooperation-wui.frame.php $WWW_DIRECTORY/index.php

echo "<hr width=\"10%\">
<a href=\"/phpmyadmin\">Phpmyadmin</a><br>
<hr width=\"20%\">
<a href=\"/\">Home</a><br>
">> $WWW_DIRECTORY/admin/cooperation-wui.frame.php

echo "<?php include('cooperation-wui.footer.php'); ?>" >> $WWW_DIRECTORY/admin/cooperation-wui.frame.php


mv $WWW_DIRECTORY/admin/cooperation-wui.frame.php $WWW_DIRECTORY/admin/index.php




echo "I: config rc.local"

echo "#!/bin/bash

exit 0" > /var/share/etc/rc.ciws

chmod +x /var/share/etc/rc.ciws

echo "
/var/share/etc/rc.ciws
exit 0

" >> /etc/rc.local
chmod +x /etc/rc.local


echo "I: Securing Lampp Server"

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

echo "I: shuting down servers"
#shutdown script
killall -9 apache2
killall -9 mysqld
killall -9 mysqld_safe



echo "I: empty temporary directory"
rm -r /tmp/*
rm -r /var/cache/apt/*

echo "I: config persistent directory"


mkdir /etc/ciws
cp -a  /var/* /etc/ciws/.

echo "----------------Cooperation-iws----------------
------------Press Enter / Appuyer sur entrée----------"
read ok < /dev/tty


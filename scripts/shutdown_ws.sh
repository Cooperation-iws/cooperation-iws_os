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
echo "I: preparing for Artwork"
mkdir /etc/skel/Desktop

if [ "$(echo "${CASPER_PATH}" | awk  '{print $1}')" == "casper" ]; then
echo "I: installing usplash theme"

cd /tmp
wget $URL_FREE/usplash-theme-ciws_0.1-1_i386.deb 
dpkg -i usplash-theme-ciws_0.1-1_i386.deb 
update-alternatives --install /usr/lib/usplash/usplash-artwork.so usplash-artwork.so /usr/lib/usplash/usplash-theme-ciws.so 10
update-alternatives --config usplash-artwork.so
wget $URL_FREE/background.png
wget $URL_FREE/logo.png
wget $URL_FREE/wallpaper.png
cp background.png /usr/share/gdm/themes/xubuntu
cp logo.png /usr/share/gdm/themes/xubuntu/logo.png 1>&2 2>/dev/null
cp background.png /usr/share/gdm/themes/Human
cp logo.png /usr/share/gdm/themes/Human/ubuntu.png
cp wallpaper.png /usr/share/backgrounds/warty-final-ubuntu.png 
cp wallpaper.png /usr/share/xfce4/backdrops/xubuntu-jmak.png  1>&2 2>/dev/null
cp wallpaper.png /usr/share/wallpapers/.
sed -i "s/kubuntu-wallpaper.jpg/wallpaper.png/" /etc/default/kdm.d/20_kubuntu_default_settings
sed -i "s/kubuntu-wallpaper.jpg/wallpaper.png/" /usr/share/apps/kdm/themes/kubuntu/kubuntu.xml


echo "I: installing liveusb installer"

wget $URL_FREE/cooperation-iws-liveusb-0.3.deb
dpkg -i cooperation-iws-liveusb-0.3.deb
apt-get -f install --assume-yes --force-yes


cat << EOT > /etc/skel/Desktop/LiveUsbinstaller.desktop
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Live usb installer
Type=Application
Terminal=false
Icon[fr_BE]=gnome-panel-launcher
Name[fr_BE]=Live usb installer
Exec=/usr/bin/liveusb
Icon=ubiquity
GenericName[fr_BE]=
EOT


cat << EOT > /etc/skel/Desktop/Cooperation-iws.desktop
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Cooperation-iws
Type=Application
Terminal=false
Icon[fr_BE]=gnome-panel-launcher
Name[fr_BE]=Cooperation-iws
Exec=firefox http://localhost
Icon=/usr/share/pixmaps/firefox-3.0.png
EOT
else
apt-get install --assume-yes --force-yes usplash
cd /tmp
wget $URL_FREE/usplash-theme-ciws_0.1-1_i386.deb 
dpkg -i usplash-theme-ciws_0.1-1_i386.deb 
update-alternatives --install /usr/lib/usplash/usplash-artwork.so usplash-artwork.so /usr/lib/usplash/usplash-theme-ciws.so 10
update-alternatives --config usplash-artwork.so
wget $URL_FREE/background.png
wget $URL_FREE/logo.png
wget $URL_FREE/wallpaper.png
cp wallpaper.png /usr/share/gdm/themes/debian-moreblue-orbit
sed -i "s/background.svg/wallpaper.png/" /usr/share/gdm/themes/debian-moreblue-orbit/debian-moreblue-orbit.xml
cp wallpaper.png /usr/share/images/desktop-base/
rm /etc/alternatives/desktop-background
ln -s  /usr/share/images/desktop-base/wallpaper.png /etc/alternatives/desktop-background
rm /etc/alternatives/desktop-splash
ln -s  /usr/share/images/desktop-base/wallpaper.png /etc/alternatives/desktop-splash


echo "I: installing liveusb installer"

wget $URL_FREE/cooperation-iws-liveusb-0.2.deb
dpkg -i cooperation-iws-liveusb-0.2.deb
apt-get -f install --assume-yes --force-yes



fi

cat << EOT > /etc/skel/Desktop/PASSWORDS.txt
Default login / password are : admin /cooperation

Except for ftp serveur: www-data / cooperation

Mantis : administrator / root

Taskfreak: admin / ciws

Lifetype, Achievo: administrator / cooperation

Phpmyadmin / Mysql Serveur / Webmin / EyeOS: root / cooperation

Mail server / Squirrelmail: admin@ciws.com / cooperation

-------------------------------------------------------------

Les login / mot de passe par défaut sont : admin /cooperation

Excepter pour le serveur ftp: www-data / cooperation

Mantis : administrator / root

Taskfreak: admin / ciws

Lifetype / Achievo: administrator / cooperation

Phpmyadmin / Mysql Serveur / Webmin /EyeOS : root / cooperation

Serveur Mail / Squirrelmail: admin@ciws.com / cooperation
EOT

chmod 777 /etc/skel/Desktop/PASSWORDS.txt

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
cp -r /home/liveusb/* /etc/skel/.
sleep 2
#virer admin et liveusb de /etc/sudoers
#cat /etc/sudoers | sed '/%admin/d' | tee /etc/sudoers
echo -e "root ALL=(ALL) ALL" | tee /etc/sudoers
#supprimer user 
userdel -r liveusb
}
REMOVE_USER



if [ "$(echo "${APACHE}" | awk  '{print $1}')" == "A" ]; then

echo "I: Configuring cooperation-iws wui"
echo "<?php include('cooperation-wui.header.php'); ?>

<center>
<img src=\"cooperation.header.jpg\"></center><br><br>
<?php include('Sphider/index.php'); ?>
<?php if ( !isset(\$_GET['query'])) {?>
<center>
" > $WWW_DIRECTORY/index.php

cat $WWW_DIRECTORY/cooperation-wui.frame.php | sort | sed '/^$/d' | sed "s/^/<hr width=\"10%\">/" | sed "s/000Cooperation-iws/Cooperation-iws/">> $WWW_DIRECTORY/index.php

echo "
<hr width=\"20%\">
<a href=\"/admin\">Admin</a><br>
</center>
<?php } else {?>
<hr width=\"20%\">
<center><h1><a href=\"/\">Home</a></h1></center><br>
<?php } ?>

" >> $WWW_DIRECTORY/index.php

echo "<?php include('cooperation-wui.footer.php'); ?>" >> $WWW_DIRECTORY/index.php

echo "<?php include('cooperation-wui.header.php'); ?>

<center>
<img src=\"cooperation.header.jpg\"><br><br>
" > $WWW_DIRECTORY/admin/index.php

cat $WWW_DIRECTORY/admin/cooperation-wui.frame.php | sort | sed '/^$/d' | sed "s/^/<hr width=\"10%\">/" >> $WWW_DIRECTORY/admin/index.php

echo "<hr width=\"10%\">
<a href=\"/phpmyadmin\">Phpmyadmin</a><br>
<hr width=\"20%\">
<a href=\"/\">Home</a><br>
">> $WWW_DIRECTORY/admin/index.php

echo "<?php include('cooperation-wui.footer.php'); ?>" >> $WWW_DIRECTORY/admin/index.php




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
killall -9 ruby 1>&2 2>/dev/null
fi

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

echo "I: config persistent directory"


mkdir /etc/ciws
cp -a  /var/* /etc/ciws/.



echo "----------------Cooperation-iws----------------
------------Press Enter / Appuyer sur entrée----------"
read ok < /dev/tty


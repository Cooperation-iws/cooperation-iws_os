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

echo "I: config post install script"
echo "

echo \"
----------------Cooperation-iws----------------
-----Press Enter / Appuyer sur entrée----------\"
read ok < /dev/tty
" >> $LAMPP_DIRECTORY/share/lampp/config_post_install.sh

chmod +x $LAMPP_DIRECTORY/share/lampp/config_post_install.sh

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

fi
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


echo "I: installing liveusb installer"

wget $URL_FREE/cooperation-iws-liveusb-0.1.deb
dpkg -i cooperation-iws-liveusb-0.1.deb
apt-get -f install --assume-yes --force-yes

mkdir /etc/skel/Desktop
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

echo "I: End of Customization"

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


echo "I: config post install script"
echo "

echo \"
----------------Cooperation-iws----------------
-----Press Enter / Appuyer sur entrée----------\"
read ok < /dev/tty
" >> $LAMPP_DIRECTORY/share/lampp/config_post_install.sh

chmod +x $LAMPP_DIRECTORY/share/lampp/config_post_install.sh

echo "I: configuring casper"
sed -i -e "405s/\/home/\/var/" /usr/share/initramfs-tools/scripts/casper
sed -i -e "412s/\/home/\/var/" /usr/share/initramfs-tools/scripts/casper
sed -i -e "13s/home-rw/ciws-rw/" /usr/share/initramfs-tools/scripts/casper
sed -i -e "15s/home-sn/ciws-sn/" /usr/share/initramfs-tools/scripts/casper




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



if [ "$(echo "${APACHE}" | awk  '{print $1}')" == "A" ]; then


echo "I: displacing /etc directories"

mv /etc/apache2 /var/share/etc/

ln -s /var/share/etc/apache2 /etc/apache2

mv /etc/php5 /var/share/etc/

ln -s /var/share/etc/php5 /etc/php5

fi

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
cp logo.png /usr/share/gdm/themes/xubuntu/logo.png
cp background.png /usr/share/gdm/themes/Human
cp logo.png /usr/share/gdm/themes/Human/ubuntu.png
cp wallpaper.png /usr/share/backgrounds/warty-final-ubuntu.png
cp wallpaper.png /usr/share/xfce4/backdrops/xubuntu-jmak.png 

echo "I: installing liveusb installer"

wget $URL_FREE/cooperation-iws-liveusb-0.1.deb
dpkg -i cooperation-iws-liveusb-0.1.deb

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

echo "I: End of Customization"

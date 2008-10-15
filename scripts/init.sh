#!/bin/bash


RMOD_ENGINE=1.0
RMOD_CATEGORY='Software'
RMOD_SUBCATEGORY='Lampp_core'
RMOD_NAME='Lampp'
RMOD_AUTHOR='Oliv'
RMOD_VERSION=0.2
RMOD_DESCRIPTION='Installs'
RMOD_RUN_IN_CHROOT=True
RMOD_UPDATE_URL='http://reconstructor.aperantis.com/update/modules/'



SCRIPT_DIRECTORY="/tmp"
echo $SCRIPT_DIRECTORY > /tmp/script-path
WWW_DIRECTORY="/var/www"
echo $WWW_DIRECTORY > /tmp/web-path
DL_DIR="/tmp/web_install"
mkdir $DL_DIR
echo $DL_DIR > /tmp/web_install-path
BIN_MYSQL="/usr/bin/mysql"
echo $BIN_MYSQL > /tmp/mysql-path
PLUGIN_DIR="${SCRIPTS_DIR}/modules"
LAMPP_DIRECTORY="/var"
echo $LAMPP_DIRECTORY > /tmp/lampp-dir
CHROOT_DIRECTORY="chroot"
echo $CHROOT_DIRECTORY > /tmp/chroot-dir
VERSION="0.5.2"
CASPER_PATH=$(cat /tmp/casper_path)
DEB_DIST=$(cat /tmp/deb_dist)
DEB_MIRROR_PATH=$(cat /tmp/deb_mirror_path)
#TEMP
MIRROIR=$(cat /tmp/mirroir)
URL_FREE=$(cat /tmp/url_mirroir)

INSTALL=$(cat /tmp/def_install)
export LANG="en"
export LC_ALL=C


if [ "$(echo $LANG | grep 'fr')" ]; then
LANG_UI="FR"
else
LANG_UI="EN"
fi
echo $LANG_UI > /tmp/lang-wui



function ADD_USER()
{
export LC_ALL=C
mkdir /etc/skel/.gconf
mkdir /etc/skel/.gconfd
mkdir -p /etc/skel/Bureau
sleep 2
#useradd -d /home/liveusb -m liveusb -s /bin/bash -p U6aMy0wojraho
useradd -d /home/liveusb -m liveusb -s /bin/bash -p U6aMy0wojraho -g root -u 1000
echo -e "root ALL=(ALL) ALL" | tee /etc/sudoers
echo -e "%admin ALL=(ALL) ALL" | tee -a /etc/sudoers
echo -e "liveusb ALL=(ALL) ALL" | tee -a /etc/sudoers
sleep 2
}
ADD_USER
export HOME=/home/liveusb
echo "liveusb" > /tmp/tmp_user

if [ "$(echo "${CASPER_PATH}" | awk  '{print $1}')" == "casper" ] && [ "$(echo "$DEB_DIST" | awk  '{print $1}')" != "etch" ]; then
echo "
deb $DEB_MIRROR_PATH/ $DEB_DIST restricted main universe multiverse
deb $DEB_MIRROR_PATH/ $DEB_DIST-updates restricted main universe multiverse
deb $DEB_MIRROR_PATH/ $DEB_DIST-security restricted main universe multiverse
" > /etc/apt/sources.list
else
echo "
deb $DEB_MIRROR_PATH/ $DEB_DIST main contrib non-free
deb-src $DEB_MIRROR_PATH/ $DEB_DIST main contrib 
#Multimedia
deb http://www.debian-multimedia.org $DEB_DIST main 
deb-src http://www.debian-multimedia.org $DEB_DIST main 
#Security
deb http://security.debian.org/ $DEB_DIST/updates main contrib non-free
deb-src http://security.debian.org/ $DEB_DIST/updates main contrib 
" > /etc/apt/sources.list
export DEBIAN_FRONTEND="dialog"
fi
apt-get update
apt-get install --yes --force-yes build-essential 


echo "I: config rc.local"
echo "#!/bin/sh

" > /etc/rc.local

echo "I: create persistent directory"
mkdir $LAMPP_DIRECTORY/share/
mkdir $LAMPP_DIRECTORY/share/lampp
mkdir $LAMPP_DIRECTORY/share/etc
mkdir $LAMPP_DIRECTORY/share/usr
mkdir $LAMPP_DIRECTORY/share/usr/share
mkdir $LAMPP_DIRECTORY/share/opt
echo "I: post install script creation"
echo "#!/bin/bash
WWW_DIRECTORY=\"/var/www\"
" > $LAMPP_DIRECTORY/share/lampp/config_post_install.sh


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
cp background.png /usr/share/wallpapers/.
cp logo.png /usr/share/apps/kdm/themes/kubuntu/
sed -i "s/kubuntu-wallpaper.jpg/wallpaper.png/" /etc/default/kdm.d/20_kubuntu_default_settings
sed -i "s/kubuntu-wallpaper.jpg/background.png/" /usr/share/apps/kdm/themes/kubuntu/kubuntu.xml
sed -i "s/Dialog.png/logo.png/" /usr/share/apps/kdm/themes/kubuntu/kubuntu.xml
sed -i 's/<pos width="640" x="50%" y="50%" anchor="c" height="400" \/>/<pos width="500" x="50%" y="30%" anchor="c" height="98" \/>/' /usr/share/apps/kdm/themes/kubuntu/kubuntu.xml

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

if [ "$(echo "${APACHE}" | awk  '{print $1}')" == "A" ]; then
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

wget $URL_FREE/cooperation-iws-liveusb-0.3.deb
dpkg -i cooperation-iws-liveusb-0.3.deb
apt-get -f install --assume-yes --force-yes



fi
if [ "$(echo "${APACHE}" | awk  '{print $1}')" == "A" ]; then
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
fi



#!/bin/bash


RMOD_ENGINE=1.0
RMOD_CATEGORY='Software'
RMOD_SUBCATEGORY='Lampp_core'
RMOD_NAME='Lampp'
RMOD_AUTHOR='Oliv'
RMOD_VERSION=0.2
RMOD_DESCRIPTION='Installs'
RMOD_RUN_IN_CHROOT=True
RMOD_UPDATE_URL=''


echo 'SCRIPT_DIRECTORY="/tmp"' >> /tmp/scripts_params

echo 'WWW_DIRECTORY="/var/www"' >> /tmp/scripts_params

echo 'DL_DIR="/tmp/web_install"' >> /tmp/scripts_params

echo 'BIN_MYSQL="/usr/bin/mysql"' >> /tmp/scripts_params

echo 'LAMPP_DIRECTORY="/opt/ciws/"' >> /tmp/scripts_params

. /tmp/scripts_params


mkdir $DL_DIR


export LANG="en"
export LC_ALL=C
export DEBIAN_FRONTEND=noninteractive

if [ "$(echo $LANG | grep 'fr')" ]; then
LANG_UI="FR"
else
LANG_UI="EN"
fi
echo $LANG_UI > /tmp/lang-wui

##LICENCE JAVA UBUNTU
echo "Name: shared/accepted-sun-dlj-v1-1
Template: shared/accepted-sun-dlj-v1-1
Value: true
Owners: sun-java5-bin, sun-java5-jre
Flags: seen
" >> /var/cache/debconf/config.dat


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

#Rubygem local mirror
echo "gem: --source $URL_CIWS_DEPOT/gem-mirror/" > $HOME/.gemrc


mv /etc/apt/sources.list /etc/apt/sources.list.orig

if [ "$(echo "$DEB_DIST" | awk  '{print $1}')" != "lenny" ] && [ "$(echo "$DEB_DIST" | awk  '{print $1}')" != "etch" ]; then
echo "
deb $DEB_MIRROR_PATH/ $DEB_DIST restricted main universe multiverse
deb $DEB_MIRROR_SECURITY_PATH/ $DEB_DIST-updates restricted main universe multiverse
deb $DEB_MIRROR_SECURITY_PATH/ $DEB_DIST-security restricted main universe multiverse
deb-src $DEB_MIRROR_PATH/ $DEB_DIST restricted main universe multiverse
deb-src $DEB_MIRROR_SECURITY_PATH/ $DEB_DIST-updates restricted main universe multiverse
deb-src $DEB_MIRROR_SECURITY_PATH/ $DEB_DIST-security restricted main universe multiverse

deb $DEBNONFREE_MIRROR_PATH/ $DEB_DIST free non-free
" > /etc/apt/sources.list
else
echo "
deb $DEB_MIRROR_PATH/ $DEB_DIST main contrib non-free
deb-src $DEB_MIRROR_PATH/ $DEB_DIST main contrib 
#Multimedia
deb $DEBNONFREE_MIRROR_PATH $DEB_DIST main 
deb-src $DEBNONFREE_MIRROR_PATH $DEB_DIST main 
#Security
deb $DEB_MIRROR_SECURITY_PATH $DEB_DIST/updates main contrib non-free
deb-src $DEB_MIRROR_SECURITY_PATH $DEB_DIST/updates main contrib 
" > /etc/apt/sources.list
export DEBIAN_FRONTEND="dialog"
fi
if [ "$(echo "$DEBNONFREE_MIRROR_PATH" | grep 'medibuntu.org')" ]; then
wget -q http://fr.packages.medibuntu.org/medibuntu-key.gpg -O- | sudo apt-key add -
else
cd $DL_DIR
wget $URL_CIWS_DEPOT/debian-multimedia-keyring_2008.10.16_all.deb
dpkg -i debian-multimedia-keyring_2008.10.16_all.deb
fi

apt-get update --fix-missing


echo "I: config rc.local"
echo "#!/bin/sh

" > /etc/rc.local


if [ "$(echo "$DEB_DIST" | awk  '{print $1}')" == "lenny" ]; then

echo " 
send host-name \"$HOSTNAME\";
request subnet-mask, broadcast-address, time-offset, routers,
	domain-name, domain-name-servers, domain-search, host-name,
	netbios-name-servers, netbios-scope;
retry 5;
" > /etc/dhcp3/dhclient.conf
fi




echo "I: create persistent directory"
mkdir $LAMPP_DIRECTORY
mkdir $LAMPP_DIRECTORY/server
mkdir $LAMPP_DIRECTORY/share
mkdir $LAMPP_DIRECTORY/share/lampp
mkdir $LAMPP_DIRECTORY/etc
mkdir $LAMPP_DIRECTORY/usr
mkdir $LAMPP_DIRECTORY/usr/share
mkdir $LAMPP_DIRECTORY/opt
mkdir $LAMPP_DIRECTORY/var/
mkdir  $LAMPP_DIRECTORY/var/lib
chown -R www-data $LAMPP_DIRECTORY/server
echo "I: post install script creation"
echo "#!/bin/bash
WWW_DIRECTORY=\"/var/www\"
" > $LAMPP_DIRECTORY/share/lampp/config_post_install.sh




if [ "$(echo "${APACHE}" | awk  '{print $1}')" == "A" ] && [ "$(echo "$DEB_DIST" | awk  '{print $1}')" == "intrepid" ]; then
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


#start-up inhibition



mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.silent_install
cat > /usr/sbin/policy-rc.d << EOF
#!/bin/sh


echo "Warning: invoke-rc.d policy in action. Skipping daemon starting"

exit 101
EOF
chmod 0755 /usr/sbin/policy-rc.d

cd /tmp/
for langxml in $(ls ciws-lang-*.xml)
do

lang_1=$(echo $langxml | cut -d'-' -f3)
lang=$(echo $lang_1 | cut -d'.' -f1)

echo "<?xml version=\"1.0\"?>
<items>" > /tmp/cooperation-wui-$lang.xml
echo "<?xml version=\"1.0\"?>
<items>" > /tmp/admin_cooperation-wui-$lang.xml

done



#!/bin/bash
#
#STAGE 3 INIT CHROOT FOR MODULES
#
#
#


RMOD_ENGINE=1.0
RMOD_CATEGORY='Software'
RMOD_SUBCATEGORY='Lampp_core'
RMOD_NAME='Lampp'
RMOD_AUTHOR='Oliv'
RMOD_VERSION=0.2
RMOD_DESCRIPTION='Installs'
RMOD_RUN_IN_CHROOT=True
RMOD_UPDATE_URL=''

echo "I:INIT CHROOT FOR MODULES"

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



#SETTING RUBY GEM LOCAL MIRROR
echo "gem: --source $URL_CIWS_DEPOT/gem-mirror/" > /etc/gemrc
chmod +x /etc/gemrc

#UPDATING SOURCES.LIST
mv /etc/apt/sources.list /etc/apt/sources.list.orig

if [ "$(echo "$DEB_DIST" | awk  '{print $1}')" == "lucid" ]; then
echo "
deb $DEB_MIRROR_PATH/ $DEB_DIST restricted main universe multiverse
deb $DEB_MIRROR_SECURITY_PATH/ $DEB_DIST-updates restricted main universe multiverse
deb-src $DEB_MIRROR_PATH/ $DEB_DIST restricted main universe multiverse
deb-src $DEB_MIRROR_SECURITY_PATH/ $DEB_DIST-updates restricted main universe multiverse

deb $DEBNONFREE_MIRROR_PATH/ $DEB_DIST free non-free
" > /etc/apt/sources.list
else
echo "
deb $DEB_MIRROR_PATH/ $DEB_DIST main contrib non-free
deb-src $DEB_MIRROR_PATH/ $DEB_DIST main contrib 
#Multimedia
deb $DEBNONFREE_MIRROR_PATH $DEB_DIST main 
deb-src $DEBNONFREE_MIRROR_PATH $DEB_DIST main 
#Backports
deb $DEB_MIRROR_PATH-backports $DEB_DIST-backports main 
#Updates
deb $DEB_MIRROR_SECURITY_PATH $DEB_DIST-updates main contrib non-free
deb-src $DEB_MIRROR_SECURITY_PATH $DEB_DIST-updates main contrib 
" > /etc/apt/sources.list
#export DEBIAN_FRONTEND="dialog"
fi

#CONFIGURING SOURCES.LIST
echo "I:Configuring sources.list.internet for standalone connection"
if [ "$(echo "$DEB_DIST" | awk  '{print $1}')" == "lucid" ] ;then
echo "
deb http://archive.ubuntu.com/ubuntu/ $DEB_DIST restricted main universe multiverse
deb http://archive.ubuntu.com/ubuntu/ $DEB_DIST-updates restricted main universe multiverse
deb http://security.ubuntu.com/ubuntu/ $DEB_DIST-security restricted main universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ $DEB_DIST restricted main universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ $DEB_DIST-updates restricted main universe multiverse
deb-src http://security.ubuntu.com/ubuntu/ $DEB_DIST-security restricted main universe multiverse

deb http://packages.medibuntu.org/ $DEB_DIST free non-free
" > /etc/apt/sources.list.internet
else
echo "
deb ftp://ftp.debian.org/debian/ $DEB_DIST main contrib non-free
deb-src ftp://ftp.debian.org/debian/ $DEB_DIST main contrib 
#Updates
deb ftp://ftp.debian.org/debian/ $DEB_DIST-updates main contrib non-free
deb-src ftp://ftp.debian.org/debian/ $DEB_DIST-updates main contrib 
#Multimedia
deb http://www.debian-multimedia.org $DEB_DIST main 
deb-src http://www.debian-multimedia.org $DEB_DIST main 
#Security
deb http://security.debian.org/ $DEB_DIST/updates main contrib non-free
deb-src http://security.debian.org/ $DEB_DIST/updates main contrib 
" > /etc/apt/sources.list.internet
#export DEBIAN_FRONTEND="dialog"
fi


apt-get update --fix-missing



#CREATE RC.LOCAL STARTUP FILE
echo "I: config rc.local"
echo "#!/bin/bash
#Wheezy hack to bring up dns
dhclient

" > /etc/rc.local








#INIT.D INHIBITION
echo "I: start inhibition"

cat > /usr/sbin/policy-rc.d << EOF
#!/bin/sh


echo "Warning: invoke-rc.d policy in action. Skipping daemon starting"

exit 101
EOF
chmod 0755 /usr/sbin/policy-rc.d





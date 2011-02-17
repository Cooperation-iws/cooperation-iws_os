#!/bin/bash

DEBIAN_LIVE_TYPE=$1
DEBIAN_DISTRIBUTION=$2
DEBIAN_ARCH=$3
DEB_MIRROR=$4
DEB_SECU_MIRROR=$5
KEYB_LANG=$6
LOCALE=$7
HOSTNAME=$8
USERNAME=$9
ENCRYPTION=${10}
ENCRYPTION_PASSPHRASE=${11}
WORK_DIR=${12}
LOCAL_DEPOT=${13}


echo "I: INSTALLING DEBIAN LIVE"
apt-get remove -y --force-yes live-helper 

cd /tmp && wget $LOCAL_DEPOT/live-helper_1.0.4+20090604.135747_all.deb
apt-get install -y --force-yes debian-keyring
cd /tmp && dpkg -i live-helper_1.0.4+20090604.135747_all.deb
apt-get install -f --assume-yes --force-yes


if [ "$ENCRYPTION" != "disabled" ]; then
ENC_CODE="--encryption $ENCRYPTION"
echo "$ENCRYPTION_PASSPHRASE" > /tmp/squashfspwd
sed -i "105s/-T/-p 3/" /usr/bin/lh_binary_encryption
sed -i "107s/tmp/tmp 3< \/tmp\/squashfspwd/" /usr/bin/lh_binary_encryption
sed -i "114s/-T/-p 3/" /usr/bin/lh_binary_encryption
sed -i "116s/tmp/tmp 3< \/tmp\/squashfspwd/" /usr/bin/lh_binary_encryption
sed -i "106s/-T/-p 3/" /usr/bin/lh_binary_encryption
sed -i "108s/tmp/tmp 3< \/tmp\/squashfspwd/" /usr/bin/lh_binary_encryption
sed -i "115s/-T/-p 3/" /usr/bin/lh_binary_encryption
sed -i "118s/tmp/tmp 3< \/tmp\/squashfspwd/" /usr/bin/lh_binary_encryption


else
ENC_CODE=""
fi


echo "I: PROCEEDING TO DEBIAN LIVE"
cd $WORK_DIR
lh_config -p $DEBIAN_LIVE_TYPE --distribution $DEBIAN_DISTRIBUTION --linux-flavours "$DEBIAN_ARCH" --mirror-bootstrap "$DEB_MIRROR" --mirror-chroot "$DEB_MIRROR" --mirror-binary "$DEB_MIRROR" --mirror-chroot-security "$DEB_SECU_MIRROR" --mirror-binary-security "$DEB_SECU_MIRROR" --apt-options "--yes  --force-yes" --bootappend-live "keyb=$KEYB_LANG locale=$LOCALE" --hostname $HOSTNAME --username $USERNAME $ENC_CODE

lh_build

rm chroot/tmp/squashfspwd

mv binary remaster
mv binary.iso debian_barebone.iso

exit 0

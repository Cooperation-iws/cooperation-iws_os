#!/bin/bash
#
#STAGE 2 PREPARING CHROOT - COPYING STAGES AND ARTWORK FILES
#
#
#


ROOT_DIR=$1
SCRIPT_DIR=$2
XML_DIR=$3
PHP_DIR=$4
ARTWORK_DIR=$5
WORK_DIR=$6
DEPOT_URL=$7
ARTWORK_NAME=$8
KEYBLANG=${9}
TEMPLATE_FILE=${10}

echo "I:PREPARING CHROOT - COPYING STAGES AND ARTWORK FILES"

#COPYING STAGE SCRIPTS
cp -r $SCRIPT_DIR/stage_3_in_chroot.sh $WORK_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/stage_4_in_chroot.sh $WORK_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/stage_5_lampp_in_chroot.sh $WORK_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/stage_6_in_chroot.sh $WORK_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/stage_7_lampp_in_chroot.sh $WORK_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/stage_9_in_chroot.sh $WORK_DIR/chroot/tmp/.

#COPYING ARTWORK IF ASKED
if [ "${ARTWORK_NAME}" ]; then
cp -r $ARTWORK_DIR/$ARTWORK_NAME.artchroot $WORK_DIR/chroot/tmp/.
cp -r $ARTWORK_DIR/$ARTWORK_NAME $WORK_DIR/chroot/tmp/.
fi

#COPYING LIB AND CONF SCRIPTS
cp -r $XML_DIR/*.xml $WORK_DIR/chroot/tmp/.
cp -r $PHP_DIR/*.php $WORK_DIR/chroot/tmp/.
cp -r $ROOT_DIR/cert $WORK_DIR/chroot/tmp/.

chmod -R 777 $WORK_DIR/chroot/tmp/

#MOVE OLD CASPER TO NEW LIVE DIRECTORY
if [ -d $WORK_DIR/remaster/casper ]; then
mv $WORK_DIR/remaster/casper $WORK_DIR/remaster/live
fi

#MOUNTING PROC FOR CHROOT
mount --bind /proc $WORK_DIR/chroot/proc

#PREPARING WGETRC
mv -f $WORK_DIR/chroot/etc/wgetrc $WORK_DIR/chroot/etc/wgetrc.orig
cp -f /etc/wgetrc $WORK_DIR/chroot/etc/wgetrc

#PREPARING HOSTNAME
mv -f $WORK_DIR/chroot/etc/hosts $WORK_DIR/chroot/etc/hosts.orig
#mv -f $WORK_DIRchroot/etc/hostname $WORK_DIR/chroot/etc/hostname.orig
cp -f /etc/hosts $WORK_DIR/chroot/etc/hosts
#cp -f /etc/hostname $WORK_DIR/chroot/etc/hostname

#PREPARING RESOLV.CONF
cp -f /etc/resolv.conf $WORK_DIR/chroot/etc/resolv.conf

#COPYING APPS PARAM
cp $TEMPLATE_FILE $WORK_DIR/chroot/tmp/app_params
chmod +x $WORK_DIR/chroot/tmp/app_params






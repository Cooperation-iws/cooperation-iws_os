#!/bin/bash

ROOT_DIR=$1
SCRIPT_DIR=$2
XML_DIR=$3
PHP_DIR=$4
ARTWORK_DIR=$5
CHROOT_DIR=$6
DEPOT_URL=$7
ARTWORK_NAME=$8
KEYBLANG=${9}

#COPYING STAGE SCRIPTS
cp -r $SCRIPT_DIR/stage_1_in_chroot.sh $CHROOT_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/stage_2_in_chroot.sh $CHROOT_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/stage_3_lampp_in_chroot.sh $CHROOT_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/stage_4_in_chroot.sh $CHROOT_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/stage_5_lampp_in_chroot.sh $CHROOT_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/stage_7_in_chroot.sh $CHROOT_DIR/chroot/tmp/.

#COPYING ARTWORK IF ASKED
if [ "$(ARTWORK_NAME)" ]; then
cp -r $ARTWORK_DIR/$ARTWORK_NAME.artchroot $CHROOT_DIR/chroot/tmp/.
cp -r $ARTWORK_DIR/$ARTWORK_NAME $CHROOT_DIR/chroot/tmp/.
fi

#COPYING LIB AND CONF SCRIPTS
cp -r $XML_DIR/*.xml $CHROOT_DIR/chroot/tmp/.
cp -r $PHP_DIR/*.php $CHROOT_DIR/chroot/tmp/.
cp -r $ROOT_DIR/cert $CHROOT_DIR/chroot/tmp/.

chmod -R 777 $CHROOT_DIR/chroot/tmp/


#UPDATING ISOLINUX
sed -i "s/vmlinuz1/vmlinuz/g" $CHROOT_DIR/remaster/isolinux/menu.cfg
sed -i "s/initrd=\/live\/initrd1.img/initrd=\/live\/initrd.gz keyb=$KEYBLANG/g" $CHROOT_DIR/remaster/isolinux/menu.cfg
sed -i "s/splash//g" $CHROOT_DIR/remaster/isolinux/isolinux.cfg

#MOVE OLD CASPER TO NEW LIVE DIRECTORY
if [ -d $CHROOT_DIR/remaster/casper ]; then
mv $CHROOT_DIR/remaster/casper $CHROOT_DIR/remaster/live
fi

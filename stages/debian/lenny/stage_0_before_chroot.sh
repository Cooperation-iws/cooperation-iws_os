#!/bin/bash

ROOT_DIR=$1
SCRIPT_DIR=$2
XML_DIR=$3
PHP_DIR=$4
ARTWORK_DIR=$5
CHROOT_DIR=$6
DEPOT_URL=$7
CMS_NAME=$8
ARTWORK_NAME=$9

#COPYING STAGE SCRIPTS
cp -r $SCRIPT_DIR/stage_1_in_chroot.sh $CHROOT_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/stage_2_in_chroot.sh $CHROOT_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/stage_3_in_chroot.sh $CHROOT_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/stage_4_in_chroot.sh $CHROOT_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/stage_5_in_chroot.sh $CHROOT_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/stage_7_in_chroot.sh $CHROOT_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/shutdown_ws.sh $CHROOT_DIR/chroot/tmp/.
cp -r $SCRIPT_DIR/cooperation-iws-wui.sh $CHROOT_DIR/chroot/tmp/.
cp -r $XML_DIR/*.xml $CHROOT_DIR/chroot/tmp/.
cp -r $PHP_DIR/*.php $CHROOT_DIR/chroot/tmp/.
cp -r $ROOT_DIR/cert $CHROOT_DIR/chroot/tmp/.
cp -r $ARTWORK_DIR/$ARTWORK_NAME $CHROOT_DIR/chroot/tmp/.
cp -r $ARTWORK_DIR/$ARTWORK_NAME.artchroot $CHROOT_DIR/chroot/tmp/.

chmod -R 777 $CHROOT_DIR/chroot/tmp/


### CIWS CMS WUI
mkdir $CHROOT_DIR/chroot/tmp/cooperation-wui
cd $CHROOT_DIR/chroot/tmp

wget $DEPOT_URL/$CMS_NAME
tar -xzf $CMS_NAME -C $CHROOT_DIR/chroot/tmp/cooperation-wui/
chmod 777 $CHROOT_DIR/chroot/tmp/cooperation-wui

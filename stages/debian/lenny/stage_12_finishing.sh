#!/bin/bash

WORK_DIR=$1
ISO_NAME=$2
ARCH=$3
LIVE_CD_FILE=$4
LIVE_CD_DESC=$5

cd $WORK_DIR ; find . -type f -print0 | xargs -0 md5sum > md5sum.txt


rm -Rf $ISO_NAME


if [ "$ARCH" == "686" ]; then

mkisofs -o $LIVE_CD_FILE -b "isolinux/isolinux.bin" -c "isolinux/boot.cat" -no-emul-boot -boot-load-size 4 -boot-info-table -V "$LIVE_CD_DESC" -cache-inodes -r -J -l $WORK_DIR/remaster

fi

if [ "$ARCH" == "amd64" ]; then

mkisofs -r -o  $LIVE_CD_FILE -b "isolinux/isolinux.bin" -c "isolinux/boot.cat" -no-emul-boot -V "$LIVE_CD_DESC" -J -l $WORK_DIR/remaster

fi

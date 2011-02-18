#!/bin/bash
#
#STAGE 12 FINISHING - CREATING NEW ISO FILE
#
#
#

WORK_DIR=$1
ISO_NAME=$2
ARCH=$3
LIVE_CD_DESC=""

echo "I:FINISHING - CREATING NEW ISO FILE"

cd $WORK_DIR/remaster ; find . -type f -print0 | xargs -0 md5sum > $WORK_DIR/remaster/md5sum.txt


rm -Rf $WORK_DIR/$ISO_NAME


if [ "$ARCH" == "686" ]; then

mkisofs -o $WORK_DIR/$ISO_NAME -b "isolinux/isolinux.bin" -c "isolinux/boot.cat" -no-emul-boot -boot-load-size 4 -boot-info-table -V "$LIVE_CD_DESC" -cache-inodes -r -J -l $WORK_DIR/remaster

fi

if [ "$ARCH" == "amd64" ]; then

mkisofs -r -o $WORK_DIR/$ISO_NAME -b "isolinux/isolinux.bin" -c "isolinux/boot.cat" -no-emul-boot -V "$LIVE_CD_DESC" -J -l $WORK_DIR/remaster

fi


md5sum $WORK_DIR/$ISO_NAME > $WORK_DIR/$WORK_DIR/$ISO_NAME.md5

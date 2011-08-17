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

echo "I:FINISHING - CREATING MD5SUMS"

cd $WORK_DIR/remaster ; find . -type f -print0 | xargs -0 md5sum > $WORK_DIR/remaster/md5sum.txt


echo "I:FINISHING - CREATING NEW ISO FILE"

rm -Rf $WORK_DIR/$ISO_NAME


mkisofs -o $WORK_DIR/$ISO_NAME -b "isolinux/isolinux.bin" -c "isolinux/boot.cat" -no-emul-boot -boot-load-size 4 -boot-info-table -V "$LIVE_CD_DESC" -cache-inodes -r -J -l $WORK_DIR/remaster



md5sum $WORK_DIR/$ISO_NAME > $WORK_DIR/$ISO_NAME.md5

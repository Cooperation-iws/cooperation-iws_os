#!/bin/bash

WORK_DIR=$1
CASPER_PATH=$2

cd $WORK_DIR
echo "I: Building squashfs"

cp chroot/initrd.gz remaster/$CASPER_PATH/.
cp chroot/vmlinuz remaster/$CASPER_PATH/.
rm -Rf remaster/$CASPER_PATH/filesystem.squashfs
mksquashfs chroot remaster/$CASPER_PATH/filesystem.squashfs -no-progress

exit 0


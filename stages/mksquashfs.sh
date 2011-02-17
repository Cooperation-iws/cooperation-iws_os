#!/bin/bash

WORK_DIR=$1
CASPER_PATH=$2

cd $WORK_DIR
echo "I: Building squashfs"

cp chroot/initrd.gz remaster/$CASPER_PATH/.
cp chroot/vmlinuz remaster/$CASPER_PATH/.
rm -Rf remaster/$CASPER_PATH/filesystem.squashfs
mksquashfs chroot remaster/$CASPER_PATH/filesystem.squashfs -no-progress

if [ -d remaster/bin ]; then

echo "I: Removing Windows programs if any"
rm -Rf remaster/bin
rm -Rf remaster/programs
rm -Rf remaster/autorun.inf
rm -Rf remaster/start.ini
rm -Rf remaster/start.exe
rm -Rf remaster/start.bmp

fi

exit 0


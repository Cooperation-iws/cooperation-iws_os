#!/bin/bash
#
#STAGE 10 BUILDING SQUASHFS FROM CHROOT
#
#
#

WORK_DIR=$1

cd $WORK_DIR
echo "I: Building squashfs"
dpkg-query -W --showformat='${Package} ${Version}\n' > remaster/live/filesystem.manifest
cp chroot/initrd.gz remaster/live/.
cp chroot/vmlinuz remaster/live/.
rm -Rf remaster/live/filesystem.squashfs
mksquashfs chroot remaster/live/filesystem.squashfs -no-progress

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


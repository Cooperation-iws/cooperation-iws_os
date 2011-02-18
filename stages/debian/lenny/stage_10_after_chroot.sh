#!/bin/bash
#
#STAGE 10 CLEANING CHROOT - BUILDING SQUASHFS FROM CHROOT
#
#
#

WORK_DIR=$1

echo "I:CLEANING CHROOT"

#RESTORING WGETRC
mv -f $WORK_DIR/chroot/etc/wgetrc.orig $WORK_DIR/chroot/etc/wgetrc

#UMOUNTING PROC
umount $WORK_DIR/chroot/proc/

#RESTORING HOSTNAME PARAMETERS
mv -f $WORK_DIR/chroot/etc/hosts.orig $WORK_DIR/chroot/etc/hosts
mv -f $WORK_DIR/chroot/etc/hostname.orig $WORK_DIR/chroot/etc/hostname

echo "I:BUILDING SQUASHFS FROM CHROOT"

cd $WORK_DIR
dpkg-query -W --showformat='${Package} ${Version}\n' > remaster/live/filesystem.manifest
cp chroot/initrd.gz remaster/live/.
cp chroot/vmlinuz remaster/live/.
rm -Rf remaster/live/filesystem.squashfs
mksquashfs chroot remaster/live/filesystem.squashfs -no-progress

if [ -d remaster/bin ]; then

echo "I: CLEANING ISO DIR"
rm -Rf remaster/bin
rm -Rf remaster/programs
rm -Rf remaster/autorun.inf
rm -Rf remaster/start.ini
rm -Rf remaster/start.exe
rm -Rf remaster/start.bmp

fi

exit 0


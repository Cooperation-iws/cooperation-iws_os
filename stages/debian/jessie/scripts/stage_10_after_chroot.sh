#!/bin/bash
#
#STAGE 10 CLEANING CHROOT - BUILDING SQUASHFS FROM CHROOT
#
#
#

WORK_DIR=$1
TEMPLATE_FILE=$2

. $TEMPLATE_FILE

echo "I:CLEANING CHROOT"

#RESTORING WGETRC
mv -f $WORK_DIR/chroot/etc/wgetrc.orig $WORK_DIR/chroot/etc/wgetrc

#UMOUNTING PROC
umount $WORK_DIR/chroot/proc/

#RESTORING HOSTS PARAMETERS
mv -f $WORK_DIR/chroot/etc/hosts.orig $WORK_DIR/chroot/etc/hosts
#mv -f $WORK_DIR/chroot/etc/hostname.orig $WORK_DIR/chroot/etc/hostname

echo "I:COPYING PACKAGES LIST"

cp $WORK_DIR/chroot/opt/ciws/usr/lib/packages.list $WORK_DIR/.


echo "I:BUILDING SQUASHFS FROM CHROOT"

cd $WORK_DIR
dpkg-query -W --showformat='${Package} ${Version}\n' > remaster/live/filesystem.manifest
cp chroot/boot/initrd.img-$kernel remaster/live/initrd.img
cp chroot/vmlinuz remaster/live/.
rm -Rf remaster/live/filesystem.squashfs
mksquashfs chroot remaster/live/filesystem.squashfs -no-progress

if [ -d remaster/bin ]; then

echo "I: CLEANING ISO DIR"
rm -Rf remaster/doc

fi

exit 0


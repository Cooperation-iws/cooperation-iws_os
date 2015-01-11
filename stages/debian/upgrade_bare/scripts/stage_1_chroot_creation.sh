#!/bin/bash
#
#STAGE 1 COPYING CHROOT
#
#
#

WORK_DIR=$1
CASPER_PATH=$2

echo "I:COPYING CHROOT"

mkdir $WORK_DIR/tmpsquash
mkdir  $WORK_DIR/chroot

mount -t squashfs -o loop $WORK_DIR/remaster/$CASPER_PATH/filesystem.squashfs $WORK_DIR/tmpsquash

rsync -at --del $WORK_DIR/tmpsquash/* $WORK_DIR/chroot/.

umount --force $WORK_DIR/tmpsquash

rm -Rf $WORK_DIR/tmpsquash

chmod 6755 $WORK_DIR/chroot/usr/bin/sudo

chmod 0440 $WORK_DIR/chroot/etc/sudoers



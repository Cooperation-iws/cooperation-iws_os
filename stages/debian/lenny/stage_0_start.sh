#!/bin/bash
#
#STAGE 0 COPYING ISO
#
#
#

ISO_NAME=$1
MOUNT_DIR=$2
WORK_DIR=$3


echo "I:COPYING ISO"

mkdir $WORK_DIR/remaster
mkdir $WORK_DIR/scripts

if [ ! -d $MOUNT_DIR ]; then
mkdir "$MOUNT_DIR"
fi

mount -o loop "$ISO_NAME" "$MOUNT_DIR"

rsync -at --del $MOUNT_DIR/* "$WORK_DIR/remaster/."

umount "$MOUNT_DIR"

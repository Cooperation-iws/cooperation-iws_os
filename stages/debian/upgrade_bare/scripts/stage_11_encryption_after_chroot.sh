#!/bin/bash
#
#STAGE 11 ENCRYPTION WORK IF --encryption HAS BEEN SELECTED
#
#
#
LH_ENCRYPTION=$1
PASSPHRASE=$2
WORKING_DIRECTORY=$3

DOSSIER_REMASTER="$WORKING_DIRECTORY/remaster"


LH_CHROOT_FILESYSTEM="squashfs"


echo "I:ENCRYPTION"


if [ ! -e "$DOSSIER_REMASTER/live" ]; then 
INITFS="casper"
else
INITFS="live"
fi

 
Chroot ()
{
	CHROOT="${1}"; shift
	COMMANDS="${@}"


		# Building with fakeroot/fakechroot
	 chroot "${CHROOT}" ${COMMANDS}


	return "${?}"
}


echo $PASSPHRASE > /tmp/squashfspwd

case "${LH_ENCRYPTION}" in
	aes128|aes192|aes256)
		encryption="aes" ;;
	luks)
		encryption="luks"
		;;
	""|disabled)
		exit 0
		;;
	*)
		echo "Encryption type %s not supported." "${LH_ENCRYPTION}"
		exit 1
		;;
esac

echo "Encrypting remaster/%s/filesystem.%s with %s..." "${INITFS}" "${LH_CHROOT_FILESYSTEM}" "${LH_ENCRYPTION}"

mv $DOSSIER_REMASTER/${INITFS}/filesystem.${LH_CHROOT_FILESYSTEM} $WORKING_DIRECTORY/chroot

if [ "$encryption" == "aes" ]; then
apt-get install --assume-yes --force-yes aespipe

while true
do
	echo
	echo " **************************************"
	echo " ** Configuring encrypted filesystem **"
	echo " **************************************"
	echo " (Passwords must be at least 20 characters long)"
	echo

	
		
		if Chroot $WORKING_DIRECTORY/chroot aespipe -e ${LH_ENCRYPTION} -p 3  \
				< $WORKING_DIRECTORY/chroot/filesystem.${LH_CHROOT_FILESYSTEM} \
				> $WORKING_DIRECTORY/chroot/filesystem.${LH_CHROOT_FILESYSTEM}.tmp 3< /tmp/squashfspwd
			then
				mv $WORKING_DIRECTORY/chroot/filesystem.${LH_CHROOT_FILESYSTEM}.tmp $DOSSIER_REMASTER/${INITFS}/filesystem.${LH_CHROOT_FILESYSTEM} 
				break
			fi


	printf "\nThere was an error configuring encryption ... Retry? [Y/n] "
	read ANSWER

	if [ "$(echo "${ANSWER}" | cut -b1 | tr A-Z a-z)" = "n" ]
	then
		unset ANSWER
		break
	fi
done
# Cleanup temporary filesystems
rm /tmp/squashfspwd

rm -f $DOSSIER_REMASTER/${INITFS}/filesystem.${LH_CHROOT_FILESYSTEM}.tmp
rm -f $WORKING_DIRECTORY/chroot/filesystem.${LH_CHROOT_FILESYSTEM}
rm -f $WORKING_DIRECTORY/chroot/filesystem.${LH_CHROOT_FILESYSTEM}.tmp

fi

if [ "$encryption" == "luks" ]; then
apt-get install --assume-yes --force-yes cryptsetup

cd $WORKING_DIRECTORY/chroot/
filesystem_size=$(du -m $WORKING_DIRECTORY/chroot/filesystem.${LH_CHROOT_FILESYSTEM}| awk '{ print $1}')
dd if=/dev/urandom of=filesystem bs=1M count=$(($filesystem_size +$(($filesystem_size*10/100))))
available_loop=$( losetup -f )
losetup $available_loop filesystem
cryptsetup luksFormat --key-file=/tmp/squashfspwd -q $available_loop
cryptsetup luksOpen $available_loop container --key-file=/tmp/squashfspwd
# Cleanup temporary filesystems
rm /tmp/squashfspwd

mkfs.ext3 /dev/mapper/container
mkdir /mnt/container
mount /dev/mapper/container /mnt/container
mv filesystem.${LH_CHROOT_FILESYSTEM} /mnt/container
umount /mnt/container
rm -rf /mnt/container
cryptsetup luksClose /dev/mapper/container
losetup -d $available_loop
mv filesystem filesystem.${LH_CHROOT_FILESYSTEM}
mv $WORKING_DIRECTORY/chroot/filesystem.${LH_CHROOT_FILESYSTEM} $DOSSIER_REMASTER/${INITFS}/filesystem.${LH_CHROOT_FILESYSTEM}  

fi
	






#!/bin/bash

LH_ENCRYPTION=$1
PASSPHRASE=$2
WORKING_DIRECTORY=$3

DOSSIER_REMASTER="$WORKING_DIRECTORY/remaster"


LH_CHROOT_FILESYSTEM="squashfs"
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


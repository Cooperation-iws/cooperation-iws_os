#!/bin/bash

WORKING_DIRECTORY=$(cat /tmp/working-directory)
INITIAL_REMASTER="/remaster"
USB_REMASTER="/remaster_usb"
HEBERGEMENT="http://cooperation.gensys.free.fr/v0.3"
LANGUAGE[3]=$(cat /tmp/usb-keyblang)
LANGUAGE[4]=$(cat /tmp/usb-bootlang)
USB_KEY=$(cat /tmp/usb_key)
PERSISTENT_LABEL="ciws-rw"

#_______________________________________________________________________________________________
#__________________________________________LANGFR_______________________________________________

function LANGFR

{
MESS_PREP="Preparation"
MESS_SQUASHFS_KO="Erreur: Il Manque Le Module: squashfs.ko"
MESS_ERR_PART="Erreur la partition"
MESS_ERR_FORMAT="n\'est pas au bon format\!"
MESS_ERR_LABEL="n\'a pas le bon label\!"
MESS_ERR_FSTAB="Erreur le disque sélectionné fait partie de fstab
ce script est fait pour des volumes amovibles
et /dev/${CLE_USB} ne devrait pas figurer dans fstab\!"
MESS_ERR_DEVDISK_1="Erreur: "
MESS_ERR_DEVDISK_2="non trouvé dans /dev/disk/by-id/usb-*"
MESS_ERR_LECTURE="Erreur: suppport accessible en lecture uniquement, verouillé?"
MESS_ERR_KEY_MINI="Erreur: clé de trop petite taille doit etre mini de 950Mo\!"
MESS_VERIF_MD5="Vérification md5 en cours..."
MESS_ERR_INITRD="Erreur: pas trouvé initrd"
MESS_ERR_KEY_SHORT_1="Erreur: clé trop petite TAILLE_UTILISABLE:"
MESS_ERR_KEY_SHORT_2="avec reserve de 100M pour $PERSISTENT_LABEL\, demandé RETOUR:"
MESS_POSE_MBR="Pose extlinux et mbr"
MESS_FORMAT_KEY="Formatage de la clé en cours\, veuillez patienter..."
MESS_COP_KEY_1=" Pourcentage de la copie sur"
MESS_COP_KEY_2=" effectué: "
MESS_ERR_FORMAT="Les valeurs trouvés semblent anormales, 
veuillez relever ces valeurs et contacter l'auteur du script,
si l'execution du script échoue."


}
#_______________________________________________________________________________________________
#__________________________________________FIN_LANGFR___________________________________________

#_______________________________________________________________________________________________
#__________________________________________FIN_LANGEN___________________________________________
function LANGEN

{
MESS_PREP="Preparation"
MESS_ERR_PART="Error: partition"
MESS_ERR_FORMAT="is not in the right format\!"
MESS_ERR_LABEL="do not have the right label\!"
MESS_ERR_FSTAB="Error: selected device is in fstab
this script is done for removable volumes
and  /dev/\${CLE_USB} shall not be in fstab\!"
MESS_ERR_DEVDISK_1="Error:"
MESS_ERR_DEVDISK_2=" not found in /dev/disk/by-id/usb-*"
MESS_ERR_LECTURE="Error: device is read only, protected ?"
MESS_FORMAT_KEY="Formatting your device\\, please wait ..."
MESS_COP_KEY_1=" Percentage of the copy"
MESS_COP_KEY_2="done: "
MESS_ERR_FORMAT="The values found seem abnormal,
Please note these values and contact the author of the script,
If the execution of the script fails."

}
#_______________________________________________________________________________________________
#__________________________________________FIN_LANGEN___________________________________________

#_______________________________________________________________________________________________
#__________________________________________LANG_CHOICE_INIT_____________________________________

function LANG_CHOICE_INIT
{

if [ "$(echo "${CHOICE_LANG}" | awk  '{print $1}')" == "A" ]; then
LANGFR
else
LANGEN
fi

}

#_______________________________________________________________________________________________
#_________________________________________FIN_LANG_CHOICE_INIT__________________________________







#_______________________________________________________________________________________________
#________________________________________TRANSFORM______________________________________________

function TRANSFORM()
{

INITRD_VMLINUZ_PATH="casper"

NOM_INITRD=$(basename $(ls -a $WORKING_DIRECTORY${INITIAL_REMASTER}/$INITRD_VMLINUZ_PATH/initrd.*))
NOM_VMLINUZ=$(basename $(ls -a $WORKING_DIRECTORY${INITIAL_REMASTER}/$INITRD_VMLINUZ_PATH/vmlinuz))

if [ ! -e "$WORKING_DIRECTORY${INITIAL_REMASTER}/$INITRD_VMLINUZ_PATH/filesystem.squashfs" ]; then 
echo "
------------------Cooperation-iws Error-------------
filesystem.squashf not found !
-----------Press Enter------------------------------
"
read tmp < /dev/tty
sleep 2
exit 0
fi

mkdir "${WORKING_DIRECTORY}${USB_REMASTER}"

cd "${WORKING_DIRECTORY}${INITIAL_REMASTER}"
cp -Rf ./* ./.disk "${WORKING_DIRECTORY}${USB_REMASTER}"
cp $INITRD_VMLINUZ_PATH/$NOM_VMLINUZ $INITRD_VMLINUZ_PATH/$NOM_INITRD install/mt86plus "${WORKING_DIRECTORY}${USB_REMASTER}"


cp isolinux/f[0-9].txt ${WORKING_DIRECTORY}${USB_REMASTER}
cp isolinux/f10.txt ${WORKING_DIRECTORY}${USB_REMASTER}

APPEND_OPT="file=/preseed/${preseed} verbose splash"
sed -i "7G" ${WORKING_DIRECTORY}${USB_REMASTER}/isolinux/isolinux.cfg
sed -i "7G" ${WORKING_DIRECTORY}${USB_REMASTER}/isolinux/isolinux.cfg
sed -i "7G" ${WORKING_DIRECTORY}${USB_REMASTER}/isolinux/isolinux.cfg
sed -i "7G" ${WORKING_DIRECTORY}${USB_REMASTER}/isolinux/isolinux.cfg
sed -i "8s/^/LABEL persistent/" ${WORKING_DIRECTORY}${USB_REMASTER}/isolinux/isolinux.cfg
sed -i "9s/^/menu label Persistent mode/" ${WORKING_DIRECTORY}${USB_REMASTER}/isolinux/isolinux.cfg
sed -i "10s/^/kernel \/$NOM_VMLINUZ/" ${WORKING_DIRECTORY}${USB_REMASTER}/isolinux/isolinux.cfg
sed -i "11s/^/append  locale=${LANGUAGE[4]} bootkbd=${LANGUAGE[3]} console-setup\/layoutcode=${LANGUAGE[3]} console-setup\/variantcode=nodeadkeys boot=casper persistent initrd=\/$NOM_INITRD root=\/dev\/ram $APPEND_OPT --/" ${WORKING_DIRECTORY}${USB_REMASTER}/isolinux/isolinux.cfg

sed -i "s/kernel \/casper\/vmlinuz/kernel \/$NOM_VMLINUZ/g" ${WORKING_DIRECTORY}${USB_REMASTER}/isolinux/isolinux.cfg
sed -i "s/initrd=\/casper\/initrd.gz/initrd=\/$NOM_INITRD/g" ${WORKING_DIRECTORY}${USB_REMASTER}/isolinux/isolinux.cfg
sed -i "s/\/install\/mt86plus/\/mt86plus/g" ${WORKING_DIRECTORY}${USB_REMASTER}/isolinux/isolinux.cfg

cp ${WORKING_DIRECTORY}${USB_REMASTER}/isolinux/isolinux.cfg ${WORKING_DIRECTORY}${USB_REMASTER}/extlinux.conf

rm -Rf ${WORKING_DIRECTORY}${USB_REMASTER}/isolinux
rm ${WORKING_DIRECTORY}${USB_REMASTER}/$INITRD_VMLINUZ_PATH/initrd*
rm ${WORKING_DIRECTORY}${USB_REMASTER}/$INITRD_VMLINUZ_PATH/vmlinuz*
cd $WORKING_DIRECTORY


TAILLE=$(($(du -sB 1 ${WORKING_DIRECTORY}${USB_REMASTER} | awk '{print $1}')/1000/1000)) #

#modifying initrd

mkdir $WORKING_DIRECTORY/initrd
cd $WORKING_DIRECTORY/initrd
cat $WORKING_DIRECTORY${USB_REMASTER}/initrd.gz | gzip -d | cpio -i


cd $WORKING_DIRECTORY/initrd
find | cpio -H newc -o | gzip > ../initrd.gz

echo "#!/bin/sh

PREREQ=\"\"
DESCRIPTION=\"removing prompt at shutdown...\"
. /scripts/casper-functions

prereqs()
{
       echo \"\$PREREQ\"
}

case \$1 in
# get pre-requisites
prereqs)
       prereqs
       exit 0
       ;;
esac

if [ \"$(ls -l /root/etc/rc0.d/*casper*)\" ]; then
log_begin_msg \"\$DESCRIPTION\"
rm /root/etc/rc0.d/*casper* 
rm /root/etc/rc6.d/*casper*
log_end_msg
fi
" > scripts/casper-bottom/99rmenterprompt

chmod +x scripts/casper-bottom/99rmenterprompt

mv -f ../initrd.gz $WORKING_DIRECTORY${USB_REMASTER}/initrd.gz


}
#_______________________________________________________________________________________________
#________________________________________FIN_TRANSFORM__________________________________________


#_______________________________________________________________________________________________
#_________________________________________FORMAT________________________________________________

function FORMAT()
{

#umount all partitions
i=1
while (( i > 0 ))
do

#echo "${LIST_SD[$i]}"
if [ -n "$(mount | grep ${USB_KEY}$i)" ]; then 
umount ${USB_KEY}$i ; 
(( i = i + 1 ))
else
break ;
fi ;
sleep 1
done
#erase all partitions
dd if=/dev/zero of=${USB_KEY} bs=512 count=1
parted -s ${USB_KEY} mklabel msdos
parted -s ${USB_KEY} mkpart primary ext2 1 100% # mkpartfs
sleep 10
umount ${USB_KEY}1
mke2fs -j -L extlinux-ro ${USB_KEY}1 #formate et pose label
sleep 3

#calcul taille dispo sur sdx1 et cible
DEBUT=$(echo "$(parted ${USB_KEY} print)" | grep "^ 1" | awk '{print $2}' | sed 's/\/*//;s/[a-z A-Z]\/*//g')
FIN=$(echo "$(parted ${USB_KEY} print)" | grep "^ 1" | awk '{print $3}' | sed 's/\/*//;s/[a-z A-Z]\/*//g')
UTILISABLE=$(($FIN - $(($(printf "%1.0f" $DEBUT)+1))))
NOUVELLE=$(($TAILLE+$(($(printf "%1.0f" $DEBUT)+1)))) 
NOUVELLE="$(($NOUVELLE + 120))" # 20 laisse un peu de marge pour eventuellement modif 2/3 truc

#calcul auto de la taille cible en fonction des cylindres de la clé
#voir doc ci-dessous tres bien faite
#http://cepcasa.info/tellmewhy/parted.html
heads=$(sfdisk -G ${USB_KEY} | awk '{print $4}')
sectors=$(sfdisk -G ${USB_KEY} | awk '{print $6}')
cylinders=$(sfdisk -G ${USB_KEY} | awk '{print $2}')

if [ "$heads" != "255" ] || [ "$sectors" != "63" ]; then
zenity --info --text "$MESS_ERR_FORMAT
heads:$heads #255
sectors:$sectors #63
cylinders:$cylinders #124
TAILLE:$TAILLE"
fi
#255*63=16065 secteurs par cylindre

#chercher valide sup à demande
i=0
while [ $i -lt $cylinders ]
do
i=$(($i+1))
#echo  "$((($i*16065)-1)) ==> $(($i*$((255 * 63 * 512))/1000/1000+1))"
RETOUR=$(($i*$(($heads * $sectors * 512))/1000/1000+1))
if [ $RETOUR -gt $NOUVELLE ]; then
break
fi
done

TAILLE_UTILISABLE=$(($cylinders * $heads * $sectors * 512 / 1000 / 1000 + 1 - 100))
if [ "$RETOUR" -gt "$TAILLE_UTILISABLE" ]; then #erreur si sup > 
sleep 2
TEXT="$MESS_ERR_KEY_SHORT_1 $TAILLE_UTILISABLE $MESS_ERR_KEY_SHORT_2 $RETOUR"
zenity --error --text "$TEXT"
exit 0
fi

#virer part temp

parted -s ${USB_KEY} rm 1
sleep 15


parted -s ${USB_KEY} mkpart primary ext2 1 $RETOUR # mkpartfs
sleep 15


parted -s ${USB_KEY} mkpart primary ext2 $RETOUR 100% # mkpartfs
sleep 15


#formate et pose label
#mkfs.ext3 -L extlinux-ro ${USB_KEY}1
mke2fs -j -L extlinux-ro ${USB_KEY}1
sleep 15

#formate et pose label
#mkfs.ext3 -L $PERSISTENT_LABEL ${USB_KEY}2
mke2fs -j -L $PERSISTENT_LABEL ${USB_KEY}2
sleep 15


parted -s ${USB_KEY} set 1 boot on
sleep 10
#parted -s ${USB_KEY} set 1 lba off
#sleep 2

#ajout mbr
#cat /usr/lib/syslinux/mbr.bin > ${USB_KEY}

blkid | grep ${USB_KEY} # verifier label ok
parted ${USB_KEY} print
fdisk -l ${USB_KEY}

#teste et retente format si echoué
SDT4=`blkid ${USB_KEY}2 | grep 'LABEL=\"$PERSISTENT_LABEL\"'`
if [ -z "${SDT4}" ]; then 

#formate et pose label
#mkfs.ext3 -L $PERSISTENT_LABEL ${USB_KEY}2
mke2fs -j -L $PERSISTENT_LABEL ${USB_KEY}2
sleep 15
fi

sleep 2
}
#_______________________________________________________________________________________________
#_______________________________________FIN__FORMAT_____________________________________________

#_______________________________________________________________________________________________
#________________________________________COPIE_LIVE_____________________________________________

function COPIE_LIVE
{
mkdir $WORKING_DIRECTORY/liveusb
test -z "${USB_KEY}" && exit 0
#test -z "${LISTE}" && exit 0
sleep 4
#test du disque avant install!!!
SDT1=`blkid ${USB_KEY}1 | grep 'TYPE=\"ext3\"'`
SDT2=`blkid ${USB_KEY}2 | grep 'TYPE=\"ext3\"'`
SDT3=`blkid ${USB_KEY}1 | grep 'LABEL=\"extlinux-ro\"'`
SDT4=`blkid ${USB_KEY}2 | grep "LABEL=\"$PERSISTENT_LABEL\""`
if [ -z "${SDT1}" ]; then 
sleep 2
zenity --error --text "$MESS_ERR_PART  ${USB_KEY}1 $MESS_ERR_FORMAT"
exit 0
elif [ -z "${SDT2}" ]; then 
sleep 2
zenity --error --text "$MESS_ERR_PART  ${USB_KEY}2 $MESS_ERR_FORMAT"
exit 0
elif [ -z "${SDT3}" ]; then 
sleep 2
zenity --error --text "$MESS_ERR_PART  ${USB_KEY}1 $MESS_ERR_LABEL"
exit 0
elif [ -z "${SDT4}" ]; then 
sleep 2
zenity --error --text "$MESS_ERR_PART  ${USB_KEY}2 $MESS_ERR_LABEL"
exit 0
else
echo -e '\E[37;44m'"\033[1m FORMATING OK \033[0m"
fi

#on demonte
if [ -n "$(mount | grep ${USB_KEY}1)" ]; then umount ${USB_KEY}1 ; fi ;
#on monte la part ext3 /dev/sdx1 de la clé
mount -t ext3 -o rw,users ${USB_KEY}1 $WORKING_DIRECTORY/liveusb
sleep 2

function DECIMALE()
{
if [ $1 = "-p" ]; then
precision=$2; shift 2;
else
precision=2  # valeur par défaut ex: #DECIMALE -p 4 158/600*100 
fi
bc -q << EOF
scale=$precision
$*
quit
EOF
}
function COPIE()
{
TAILLE=$(($(du -sB 1 ${WORKING_DIRECTORY}${USB_REMASTER} | awk '{print $1}')/1000/1000));T1=1;
`rsync -aH --exclude="*~" ${WORKING_DIRECTORY}${USB_REMASTER}/. $WORKING_DIRECTORY/liveusb/.`& sleep 1;
(i=0 ; while [ $i -lt ${TAILLE} ] ; do
T1=$(($(du -sB 1 $WORKING_DIRECTORY/liveusb | awk '{print $1}')/1000/1000))
i=$T1;
T2=`DECIMALE -p 2 $T1/$TAILLE*100`;
TEXT="$MESS_COP_KEY_1  ${USB_KEY}1 $MESS_COP_KEY_2 (${T2}%)  ${TAILLE}Mb"
(echo -e "${T2}\n#$TEXT";) #mod
sleep 1 ;
done) | zenity --progress --width 600 --auto-close
}
COPIE

MESSAGE="$MESS_POSE_MBR"
extlinux -i $WORKING_DIRECTORY/liveusb
umount $WORKING_DIRECTORY/liveusb
sleep 2
cat /usr/lib/syslinux/mbr.bin > ${USB_KEY}
sleep 2
sleep 2
}
#_______________________________________________________________________________________________
#___________________________________FIN__COPIE_LIVE_____________________________________________

echo "
--------------Cooperation-iws--------------
------------Making your Usb key------------
"
LANG_CHOICE_INIT
TRANSFORM
FORMAT
COPIE_LIVE

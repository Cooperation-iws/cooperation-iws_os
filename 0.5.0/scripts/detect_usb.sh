#!/bin/bash

function LANGFR

{
MESS_ERR_PART="Erreur la partition"
MESS_ERR_FORMAT="n\'est pas au bon format\!"
MESS_ERR_LABEL="n\'a pas le bon label\!"
MESS_ERR_FSTAB="Erreur le disque sélectionné fait partie de fstab
ce script est fait pour des volumes amovibles
et /dev/${CLE_USB} ne devrait pas figurer dans fstab\!"
MESS_ERR_DEVDISK_1="Erreur: "
MESS_ERR_DEVDISK_2="non trouvé dans /dev/disk/by-id/usb-*"
MESS_ERR_LECTURE="Erreur: suppport accessible en lecture uniquement, verouillé?"
MESS_BEGIN_LIVEUSB="Nous allons maintenant créer le live-usb sur votre support amovible. Veuillez l'avoir à proximité."
MESS_DETECT_USB="#Détection automatique de votre clé USB\nVeuillez brancher ou débrancher puis rebrancher votre clé USB."
MESS_FIN_DETECT="Fin du script,votre clé USB n'a pas été détectée dans le délai imparti."
MESS_SELECT_DISK="veuillez sélectionner un disque et non une partition\! Ex: sda,sdb;sdc,..."
MESS_DETECT_DISK_1="Votre clé USB à été détectée en"
MESS_DETECT_DISK_2="si cela ne vous semble pas exact, veuillez utiliser le bouton Annuler.
Attention vous allez effacer"
MESS_ERR_KEY_MINI="Erreur: clé de trop petite taille doit etre mini de 950Mo\!"


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
MESS_BEGIN_LIVEUSB="We will now create the liveusb. Please have your usb device near you."
MESS_DETECT_USB="#Automatic detection of your usb device\n Please connect or disconnect and reconnect your USB drive."
MESS_FIN_DETECT="End of the script. Your usb key was not detected"
MESS_SELECT_DISK="Please choose device, not partition\! Ex: sda,sdb;sdc,..."
MESS_DETECT_DISK_1="Your key has been detected in "
MESS_DETECT_DISK_2="If it seems you wrong, use the cancel button.
Warning you will delete"
MESS_ERR_KEY_MINI="Error: device shall at least size 950 Mo\!"

}
#_______________________________________________________________________________________________
#__________________________________________FIN_LANGEN___________________________________________

#_______________________________________________________________________________________________
#__________________________________________CHOICE_LANG__________________________________________
function CHOICE_LANG
{
if [ "$(echo "${CHOICE_LANG}" | awk  '{print $1}')" == "A" ]; then
LANGFR
export LANG_UI="FR"
else
LANGEN
export LANG_UI="EN"
fi
}
#_______________________________________________________________________________________________
#__________________________________________CHOICE_LANG__________________________________________


#_______________________________________________________________________________________________
#______________________________________CHOIX_DISQUE_____________________________________________
function CHOIX_DISQUE()
{
echo "" > /tmp/usb_key
echo "" > /tmp/RESULT_SD
MESSAGE="$MESS_BEGIN_LIVEUSB"
zenity --info --text "$MESSAGE"
sleep 5
CLE_USB=""
LIMIT=30
echo $(date +%s) > "/tmp/Log_liveusb.txt"

function BTN_ANNULER()
{
sudo rm /tmp/Log_liveusb.txt
#PREPARATION
kill -9 $PID_SCRIPT
exit 0
}

if [ ! -e /proc/partitions ]; then
exit 0
fi; 

{
cat /proc/partitions | grep "sd[a-z]$" | awk '{print $4}' >/tmp/CHECK_SD
for ((a=1; a <= LIMIT ; a++))
do
echo "zzZZzz" ; 
(echo ${a}bidule) ; 
(echo "$MESS_DETECT_USB") ;
cat /proc/partitions | grep "sd[a-z]$" | awk '{print $4}' >/tmp/CHECK_SD2
sleep 2 ;

DIFF=$(diff -a /tmp/CHECK_SD /tmp/CHECK_SD2 | sed -n 2p | awk '{print $2}')

if ! [ -e "/tmp/Log_liveusb.txt" ]; then #fin de la boucle
break ;

elif [[ "$DIFF" && ! -e /dev/$DIFF ]]; then #eject
(echo "#eject clé $DIFF") ;
cat /proc/partitions | grep "sd[a-z]$" | awk '{print $4}' >/tmp/CHECK_SD
sleep 2 ;

elif [[ "$DIFF" && -e /dev/$DIFF ]]; then #ok trouvé
echo "$DIFF" >/tmp/RESULT_SD
break ; 

elif [ "${a}" -ge "$LIMIT" ]; then #timeout dépassé fin
zenity --error --text "$MESS_FIN_DETECT"&
sudo rm /tmp/Log_liveusb.txt
kill -9 $PID_SCRIPT
exit 0

else #boucle
(echo "#Recherche... Timeout Attente / waiting $(( ${a} * 4 )) secondes (Max $(($LIMIT*4)) secondes)") ;
sleep 2 ; 
fi

done ;
 } | zenity --progress --progress --auto-close || BTN_ANNULER
CLE_USB=$(cat /tmp/RESULT_SD)


#cherche UUID et sd? de la clé usb, et verifie que n'est pas dans fstab
blkid -s UUID | grep /dev/$CLE_USB | while read line
do
UUID="$(echo $line  | awk  '{print $2}' | awk -F\" '{print $2}')"
if [[ "$(echo $(cat /etc/fstab) | grep "$UUID")" || "$(echo $(cat /etc/fstab) | grep "/dev/$CLE_USB")" ]]; then
zenity --error --text "$MESS_ERR_FSTAB"
exit 0
fi
done

TEST_DISKUSB=`ls -la /dev/disk/by-id/usb-* | grep "${CLE_USB}"`
TEST_WRITE=$(hdparm -v /dev/${CLE_USB} | grep readonly | awk '{print $3}')

if ! [ -e /dev/${CLE_USB} ]; then #n'existe pas
zenity --error --text "/dev/${CLE_USB} n\'existe pas \!"
exit 0

elif ! [ "$(echo "/dev/${CLE_USB}" | grep -i "/dev/sd.*[0-9]")" == "" ]; then #erreur pas racine
zenity --error --text "$MESS_SELECT_DISK"
exit 0

elif ! [ "${TEST_DISKUSB}" ]; then #erreur pas monté dans usb!
zenity --error --text "$MESS_ERR_DEVDISK_1 ${CLE_USB} $MESS_ERR_DEVDISK_2"
exit 0

elif [ "$TEST_WRITE" != "0" ]; then #test unlock
zenity --error --text "$MESS_ERR_LECTURE"
exit 0

elif [ -e /dev/${CLE_USB} ]; then #ok existe 
CHOIX_DD=$(fdisk -l | grep -i ^/dev/${CLE_USB})

LISTE_PART_SUPP=()
NBPART=$(fdisk -lu /dev/${CLE_USB} | grep -i "^/dev/${CLE_USB}[0-9]" | awk  '{print $1}'  | tr "\n" " " > /tmp/LISTE_PART_SUPP.txt)
LISTE_PART_SUPP=(${LISTE_PART_SUPP[@]} `cat /tmp/LISTE_PART_SUPP.txt`)
TEXT="$MESS_DETECT_DISK_1  /dev/${CLE_USB} $MESS_DETECT_DISK_2 \"${#LISTE_PART_SUPP[@]}\" partition(s)\!
${CHOIX_DD}"
zenity --question --title="Alerte" --text="$TEXT"

test $? -ne 0 && exit 0 # Bouton Annuler
#verif taille clé
TEST_TAILLE=$(($(sfdisk -s /dev/${CLE_USB}) / 1000))

if  [ "$TEST_TAILLE" -ge "950" ]; then
FINISH="1"
else
TEXT=$MESS_ERR_KEY_MINI
zenity --error --text "$TEXT"
exit 0
fi

echo "/dev/${CLE_USB}" > /tmp/usb_key

fi
}
#_______________________________________________________________________________________________
#___________________________________FIN_CHOIX_DISQUE____________________________________________

CHOICE_LANG
CHOIX_DISQUE

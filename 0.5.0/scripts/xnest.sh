#!/bin/bash



sudo apt-get -y --force-yes install xserver-xephyr xnest

function XNEST_CHROOT()
{

#________________________________________________________________
#________________________DEMARRAGE_XNEST_________________________

function CHOICE_KEYBOARD
{
LANGUAGE[0]=$(cat /etc/X11/xorg.conf | grep XkbLayout | cut -d'"' -f4)


}

function DEMARRAGE_XNEST()
{
#demarrage de xnest
killall -9 Xnest &>/dev/null
rm -f /tmp/.X5-lock
Xnest :5  -ac +kb -br -s 120 -sync -full&
sleep 2
DISPLAY=localhost:5.0 metacity --replace&
DISPLAY=localhost:5.0 xclock&
DISPLAY=localhost:5.0 setxkbmap -layout ${LANGUAGE[0]} -model pc105&
sleep 2
#detecter si xnest est bien lancé
XN1=$(ps ax | grep Xnest | grep -v grep | awk '{print $1}')
if [ ! "$XN1" ]; then
echo -e "\033[1;47;31m Erreur: Détection Xnest \033[0m" ;
zenity --error --text "Erreur: Détection Xnest"
exit 0
fi
}


function DEMARRAGE_ZEPHYR()
{
#demarrage de xnest
killall -9 Xephyr &>/dev/null
rm -f /tmp/.X5-lock
Xephyr :5  -host-cursor -dpi 96 -ac  -br -s 120 -screen 800x600&
sleep 2
DISPLAY=localhost:5.0 metacity --replace&
DISPLAY=localhost:5.0 xclock&
DISPLAY=localhost:5.0 setxkbmap -layout ${LANGUAGE[0]} -model pc105&
sleep 2
#detecter si Xephyr est bien lancé
XN1=$(ps ax | grep Xephyr | grep -v grep | awk '{print $1}')
if [ ! "$XN1" ]; then
echo -e "\033[1;47;31m Erreur: Détection Xephyr \033[0m" ;
zenity --error --text "Erreur: Détection Xephyr"
exit 0
fi

echo $XN1 > /tmp/XN1

}

CHOICE_KEYBOARD
#DEMARRAGE_XNEST
DEMARRAGE_ZEPHYR

}

XNEST_CHROOT


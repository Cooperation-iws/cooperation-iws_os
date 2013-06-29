#!/bin/bash
#
#STAGE 4 EMPTY
#
#
#

. /tmp/scripts_params

. /tmp/app_params


#Upgrading to latest depot

apt-get upgrade --assume-yes --force-yes



#Preventing shutdown prevention

if [ "$DEB_DIST" == "squeeze" ] ; then

	if [ $(cat /etc/X11/default-display-manager | grep gdm) ]; then 

sed -i "26s/auth_admin_keep/yes/" /usr/share/polkit-1/actions/org.freedesktop.consolekit.policy
sed -i "44s/auth_admin_keep/yes/" /usr/share/polkit-1/actions/org.freedesktop.consolekit.policy

	fi


#Disabling consolekit-daemon (eats too much cpu)

rm /usr/share/dbus-1/system-services/org.freedesktop.ConsoleKit.service


#disable by gdm12
	


	if [ $(cat /etc/X11/default-display-manager | grep gdm12) ]; then 

		apt-get install --assume-yes --force-yes gnome-device-manager

	fi


fi

#disable by gdm12

if [ $(cat /etc/X11/default-display-manager | grep gdm12) ]; then 

	apt-get install --assume-yes --force-yes hal halevt 


echo '
	sed -i "s/<\/config>//" /etc/PolicyKit/PolicyKit.conf
	
	echo "
<match action=\"org.freedesktop.hal.storage.ount-removable\">
<match user=\"halevt\">
<return result=\"yes\">
</match>
</match>

</config>
" >> /etc/PolicyKit/PolicyKit.conf
' >> /lib/live/config/110-policykit

fi


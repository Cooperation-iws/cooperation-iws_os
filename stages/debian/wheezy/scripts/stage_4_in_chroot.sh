#!/bin/bash
#
#STAGE 4 EMPTY
#
#
#

. /tmp/scripts_params

. /tmp/app_params


#Building gnome-volume-manager

if [ "$DEB_DIST" == "squeeze" ] ; then

	#From source
	#apt-get install --assume-yes --force-yes build-essential checkinstall
	#apt-get build-dep gnome-volume-manager
	#cd $DL_DIR
	#mkdir g-v-m
	#cd g-v-m
	#apt-get source gnome-volume-manager
	#cd gnome-volume-manager*
	#./configure
	#checkinstall -D
#	apt-get install --assume-yes --force-yes hal
#	if [ "$ARCH" == "amd64" ] ; then
#		cd $DL_DIR
#		wget $URL_CIWS_DEPOT/gnome-volume-manager_2.24.1-1_amd64.deb
#		(echo "Y") | dpkg -i gnome-volume-manager_2.24.1-1_amd64.deb
#	fi



	


	if [ $(cat /etc/X11/default-display-manager | grep gdm) ]; then 

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


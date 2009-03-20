#!/bin/bash
cd /home/esmalif/cooperation/0.9_code_cleaning



./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/Live/edubuntu_8.10.iso --modulesfile templates/upgrade_intrepid --webappmirror http://ciwsdev.cooperation-iws.intra:81/depot --debmirror http://ciwsdev.cooperation-iws.intra:3142/fr.archive.ubuntu.com/ubuntu/ --debmirrornonfree http://ciwsdev.cooperation-iws.intra:3142/packages.medibuntu.org/ --debmirrorsecurity http://ciwsdev.cooperation-iws.intra:3142/fr.archive.ubuntu.com/ubuntu/ --cms Wordpress --directory /media/partage-dev/tmp/zabczzz0zc81 --host client --outputisoname cooperation-iws-edubuntu-8.10-update-090310.iso --isotype edubuntu_8.10 --ostype Client 

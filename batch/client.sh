#!/bin/bash
cd /home/esmalif/cooperation/0.9_code_cleaning

rm -r /media/partage-dev/tmp/*

#webapp_mirror="http://ciwsdev.cooperation-iws.intra:81/depot"
#deb_mirror="ttp://ciwsdev.cooperation-iws.intra:3142/fr.archive.ubuntu.com/ubuntu/"
#deb_nonfree_mirror="http://ciwsdev.cooperation-iws.intra:3142/packages.medibuntu.org/"
#deb_security_mirror="ttp://ciwsdev.cooperation-iws.intra:3142/fr.archive.ubuntu.com/ubuntu/"

webapp_mirror="http://192.168.1.6:81/depot"
deb_mirror="http://192.168.1.6:3142/fr.archive.ubuntu.com/ubuntu/"
deb_nonfree_mirror="http://192.168.1.6:3142/packages.medibuntu.org/"
deb_security_mirror="http://192.168.1.6:3142/fr.archive.ubuntu.com/ubuntu/"



sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/cooperation-iws-kubuntu-8.10-update-090310.iso --modulesfile templates/Clients/client_gen_intrepid --webappmirror $webapp_mirror --debmirror $deb_mirror --debmirrornonfree $deb_nonfree_mirror --debmirrorsecurity $deb_security_mirror --directory /media/partage-dev/tmp/q7a1 --host ciws-client --password cooperation --username ciwsadmin --silent --outputisoname cooperation-iws-kubuntu-8.10-client-0.8.0.iso --ostype Client --artwork ciwsGnome --disautologin
 
sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/ciws-kubuntu-8.04.1-client-0.5.2.iso --modulesfile templates/Clients/client_gen_hardy --webappmirror $webapp_mirror --debmirror $deb_mirror --debmirrornonfree $deb_nonfree_mirror --debmirrorsecurity $deb_security_mirror --directory /media/partage-dev/tmp/p6a2 --host ciws-client --password cooperation --username ciwsadmin --silent --outputisoname cooperation-iws-kubuntu-8.04.1-client-0.8.0.iso --disautologin --ostype Client --artwork ciwsGnome

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/ubuntu-8.04.1-update-090310.iso --modulesfile templates/Clients/client_gen_hardy --webappmirror $webapp_mirror --debmirror $deb_mirror --debmirrornonfree $deb_nonfree_mirror --debmirrorsecurity $deb_security_mirror --directory /media/partage-dev/tmp/o6a3 --host ciws-client --password cooperation --username ciwsadmin --silent --outputisoname cooperation-iws-ubuntu-8.04.1-client-0.8.0.iso --ostype Client --artwork ciwsGnome --disautologin


sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/ciws-xubuntu-8.04.1-client-0.5.2.iso --modulesfile templates/Clients/client_gen_hardy --webappmirror $webapp_mirror --debmirror $deb_mirror --debmirrornonfree $deb_nonfree_mirror --debmirrorsecurity $deb_security_mirror --directory /media/partage-dev/tmp/n6a4 --host ciws-client --password cooperation --username ciwsadmin --silent --outputisoname cooperation-iws-xubuntu-8.04.1-client-0.8.0.iso --ostype Client --artwork ciwsGnome --disautologin


sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/cooperation-iws-ubuntu-8.10-update-090310.iso --modulesfile templates/Clients/client_gen_intrepid --webappmirror $webapp_mirror --debmirror $deb_mirror --debmirrornonfree $deb_nonfree_mirror --debmirrorsecurity $deb_security_mirror --directory /media/partage-dev/tmp/m6a5 --host ciws-client --password cooperation --username ciwsadmin --silent --outputisoname cooperation-iws-ubuntu-8.10-client-0.8.0.iso --ostype Client --artwork ciwsGnome --disautologin

sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/ciws-xubuntu-8.10-client-0.5.2.iso --modulesfile templates/Clients/client_gen_intrepid --webappmirror $webapp_mirror --debmirror $deb_mirror --debmirrornonfree $deb_nonfree_mirror --debmirrorsecurity $deb_security_mirror --directory /media/partage-dev/tmp/l6a6 --host ciws-client --password cooperation --username ciwsadmin --silent --outputisoname cooperation-iws-xubuntu-8.10-client-0.8.0.iso --ostype Client --artwork ciwsGnome --disautologin


#sudo ./cooperation-iws.py -c --createdirectories --modulesfile templates/Clients/empty --debmirror http://ciwsdev.cooperation-iws.intra:81/deb/mirror/ftp.fr.debian.org/debian/ --debmirrornonfree http://ciwsdev.cooperation-iws.intra:81/deb/mirror/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity ftp://security.debian.org/debian-security/ --directory /media/partage-dev/tmp/9a8 --host ciws-client  --outputisoname ciws-webconverger-eu-0.5.2.iso --keyblang fr --debianlive --webconverger --webappmirror $webapp_mirror --ostype Client

#sudo ./cooperation-iws.py -c --createdirectories --modulesfile templates/Clients/empty --debmirror http://ciwsdev.cooperation-iws.intra:81/deb/mirror/ftp.fr.debian.org/debian/ --debmirrornonfree http://ciwsdev.cooperation-iws.intra:81/deb/mirror/mirror.home-dn.net/debian-multimedia/ --debmirrorsecurity ftp://security.debian.org/debian-security/ --directory /media/partage-dev/tmp/10a9 --host ciws-client  --outputisoname ciws-webconverger-asia-0.5.2.iso --keyblang fr --debianlive --webconverger --webappmirror $webapp_mirror --ostype Client --webconvergerlocale webconverger-asia

./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/cooperation-iws-edubuntu-8.10-update-090310.iso --modulesfile templates/Clients/client_gen_intrepid --webappmirror $webapp_mirror --debmirror $deb_mirror --debmirrornonfree $deb_nonfree_mirror --debmirrorsecurity $deb_security_mirror --cms Wordpress --directory /media/partage-dev/tmp/k0zc81 --host client --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-edubuntu-8.10-0.8.0.iso --isotype edubuntu_8.10 --ostype Client --silent --disautologin

./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/cooperation-iws-eeebuntu-nbr-2.0-update-090310.iso --modulesfile templates/Clients/client_gen_intrepid --webappmirror $webapp_mirror --debmirror $deb_mirror --debmirrornonfree $deb_nonfree_mirror --debmirrorsecurity $deb_security_mirror --cms Wordpress --directory /media/partage-dev/tmp/i0zc810 --host client --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-eeebuntu-standard-2.0-0.8.0.iso --isotype eeebuntu_8.10 --ostype Client --silent --disautologin

./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/cooperation-iws-maryan-update-090310.iso --modulesfile templates/Clients/client_gen_hardy --webappmirror $webapp_mirror --debmirror $deb_mirror --debmirrornonfree $deb_nonfree_mirror --debmirrorsecurity $deb_security_mirror --cms Wordpress --directory /media/partage-dev/tmp/h0zc811 --host client --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-maryan-0.8.0.iso --isotype maryan_8.04.1 --ostype Client --silent --disautologin

./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/cooperation-iws-nubuntu-8.12-update-090310.iso --modulesfile templates/Clients/client_gen_intrepid --webappmirror $webapp_mirror --debmirror $deb_mirror --debmirrornonfree $deb_nonfree_mirror --debmirrorsecurity $deb_security_mirror --cms Wordpress --directory /media/partage-dev/tmp/g10zc812 --host client --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-nubuntu-8.12-0.8.0.iso --isotype nubuntu_8.10 --ostype Client --silent --disautologin

./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/cooperation-iws-opengeu-8.04.1-update-090310.iso --modulesfile templates/Clients/client_gen_hardy --webappmirror $webapp_mirror --debmirror $deb_mirror --debmirrornonfree $deb_nonfree_mirror --debmirrorsecurity $deb_security_mirror --cms Wordpress --directory /media/partage-dev/tmp/f0zc813 --host client --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-opengeu-8.04.1-0.8.0.iso --isotype opengeu_8.04.1 --ostype Client --silent --disautologin


./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/cooperation-iws-poseidon-update-090310.iso --modulesfile templates/Clients/client_gen_hardy --webappmirror $webapp_mirror --debmirror $deb_mirror --debmirrornonfree $deb_nonfree_mirror --debmirrorsecurity $deb_security_mirror --cms Wordpress --directory /media/partage-dev/tmp/e0zc816 --host client --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-poseidon-0.8.0.iso --isotype poseidon-3.1 --ostype Client --silent --disautologin


./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/cooperation-iws-netbook-remix-8.10-update-090310.iso --modulesfile templates/Clients/client_gen_intrepid --webappmirror $webapp_mirror --debmirror $deb_mirror --debmirrornonfree $deb_nonfree_mirror --debmirrorsecurity $deb_security_mirror --cms Wordpress --directory /media/partage-dev/tmp/d0zc817 --host client --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-netbook-remix-8.10-0.8.0.iso --isotype netbook-remix_8.10 --ostype Client --silent --disautologin



./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/cooperation-iws-ubuntu_studio-8.10.iso --modulesfile templates/Clients/client_multimedia_intrepid --webappmirror $webapp_mirror --debmirror $deb_mirror --debmirrornonfree $deb_nonfree_mirror --debmirrorsecurity $deb_security_mirror --cms Wordpress --directory /media/partage-dev/tmp/c0zc820 --host client --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-gw-intranet-0.7.1.iso --isotype studio_8.10 --ostype Client --silent --disautologin

./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/cooperation-iws-eeebuntu-base-2.0-update-090310.iso --modulesfile templates/Clients/client_gen_intrepid --webappmirror $webapp_mirror --debmirror $deb_mirror --debmirrornonfree $deb_nonfree_mirror --debmirrorsecurity $deb_security_mirror --cms Wordpress --directory /media/partage-dev/tmp/b10zc82 --host client --password cooperation --username ciwsadmin --artwork ciwsGnome --outputisoname cooperation-iws-eeebuntu-nbr-2.0-0.8.0.iso --isotype eeebuntu_8.10 --ostype Client --silent --disautologin

#sudo ./cooperation-iws.py -c --createdirectories --isofile /media/partage-dev/ISO/cooperation-iws-kubuntu-8.10-update-090310.iso --modulesfile templates/Clients/client_edu_intrepid --webappmirror $webapp_mirror --debmirror http://ciwsdev.cooperation-iws.intra:81/deb/mirror/ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/ --debmirrornonfree http://ciwsdev.cooperation-iws.intra:81/deb/mirror/packages.medibuntu.org/ --directory /media/partage-dev/tmp/bvazabc7a1 --host ciws-client --password cooperation --username ciwsadmin --silent --outputisoname ciws-kubuntu-elearn-8.10-client-0.5.2.iso --ostype Client --artwork ciwsGnome --disautologin



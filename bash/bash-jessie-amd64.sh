#!/bin/bash
ciws_path="/home/esmalif/app/livescripts-trunk/"
working_path="/home/esmalif/app/work/"
iso_path="/home/esmalif/app/iso/"
template="/home/esmalif/app/livescripts-trunk/bash/templates/template-test-jessie-amd64.sh"
webappmirror="http://live-server-2015-1.intra/depot_jessie/"
debian_deb_mirror="http://wwi.my-desktop-kvm.intra/ftp.local.debian.org//debian"
debian_deb_mirror_nonfree="http://wwi.my-desktop-kvm.intra/ftp.local.debian.org/debian_multimedia/"
debian_deb_mirror_security="http://wwi.my-desktop-kvm.intra/ftp.local.debian.org/debian_updates/"
#debian_deb_mirror="http://192.168.22.19/ftp.local.debian.org//debian"
#debian_deb_mirror_nonfree="http://192.168.22.19/ftp.local.debian.org/debian_multimedia/"
#debian_deb_mirror_security="http://192.168.22.19/ftp.local.debian.org/debian/"
log_path="/home/ciwsadmin/app/log/"
mirror_domain="localhost"

#ubuntu_deb_mirror="http://$mirror_domain:3142/fr.archive.ubuntu.com/ubuntu/"
ubuntu_deb_mirror="http://$mirror_domain:3142/wwi.my-server-kvm-2.intra/jaunty-mirror/ubuntu/"

ubuntu_deb_mirror_nonfree="http://$mirror_domain:3142/packages.medibuntu.org/"

ubuntu_deb_mirror_security="http://$mirror_domain:3142/wwi.my-server-kvm-2.intra/jaunty-mirror/ubuntu-security/"

apt-get install squashfs-tools genisoimage rsync syslinux


#mount -oremount,dev,exec /media/disk-1

cd /home/esmalif/app/livescripts-trunk

#sudo ./cooperation-iws.py -c --createdirectories --dist debian --directory $working_path/test372 --outputisoname cooperation-iws-dev-server-2-squeeze-amd64.iso --username esmalif --userfullname ciws-user --password Lokkir11 --host desk-server-3 --isofile $iso_path/gnome-squeeze-amd64-110818.iso --distvers squeeze --modulesfile $template --webappmirror $webappmirror --debmirror $debian_deb_mirror --debmirrornonfree $debian_deb_mirror_nonfree --arch amd64 --debmirrorsecurity $debian_deb_mirror_security --artwork wheezy --locale fr --keyblang fr --disautologin --encryption aes256 --encryptionpassphrase 01234567890123456789 --silent

#sudo ./cooperation-iws.py -c --createdirectories --dist debian --directory $working_path/test369 --outputisoname cooperation-iws-1c42e1d9b8024c0552ffd8c8ca2ab760-2011-02-22-10-24-20.iso --username ciwsadmin --userfullname ciws-user --password cooperation --host ciws-server --isofile $iso_path/gnome-squeeze-amd64-110818.iso --distvers squeeze --modulesfile $template --webappmirror $webappmirror --debmirror $debian_deb_mirror --debmirrornonfree $debian_deb_mirror_nonfree --arch amd64 --debmirrorsecurity $debian_deb_mirror_security --artwork wheezy --locale fr --keyblang fr --disautologin --silent


#sudo ./cooperation-iws.py -c --createdirectories --dist debian --directory $working_path/test541 --outputisoname cooperation-iws-1c42e1d9b8024c0552ffd8c8ca2ab760-2011-02-22-10-24-21.iso --username ciwsadmin --userfullname ciws-user --password cooperation --host desk-server-3 --isofile $iso_path/gnome-squeeze-amd64-120116.iso --distvers squeeze --modulesfile $template --webappmirror $webappmirror --debmirror $debian_deb_mirror --debmirrornonfree $debian_deb_mirror_nonfree --arch amd64 --debmirrorsecurity $debian_deb_mirror_security --artwork wheezy --locale fr --keyblang fr --disautologin --silent

#--encryption luks --encryptionpassphrase 01234567890123456789

#sudo ./cooperation-iws.py -c --createdirectories --dist debian --directory $working_path/test248 --outputisoname cooperation-iws-1c42e1d9b8024c0552ffd8c8ca2ab760-2011-02-22-10-24-21.iso --username ciwsadmin --userfullname ciws-user --password cooperation --host desk-server-6 --isofile $iso_path/jessie-gnome-amd64-150622.iso --distvers jessie --modulesfile $template --webappmirror $webappmirror --debmirror $debian_deb_mirror --debmirrornonfree $debian_deb_mirror_nonfree --arch amd64 --debmirrorsecurity $debian_deb_mirror_security --artwork jessie --locale fr_FR.UTF-8 --keyblang fr --disautologin  --silent

sudo ./cooperation-iws.py -c --createdirectories --dist debian --directory $working_path/test256 --outputisoname cooperation-iws-1c42e1d9b8024c0552ffd8c8ca2ab760-2011-02-22-10-24-21.iso --username esmalif --userfullname ciws-user --password Lokkir11 --host live-server-3 --isofile $iso_path/jessie-gnome-amd64-150622.iso --distvers jessie --modulesfile $template --webappmirror $webappmirror --debmirror $debian_deb_mirror --debmirrornonfree $debian_deb_mirror_nonfree --arch amd64 --debmirrorsecurity $debian_deb_mirror_security --artwork jessie --locale fr_FR.UTF-8 --keyblang fr --disautologin --silent --encryption luks --encryptionpassphrase 04qwerty07197604121942* 

#sudo ./cooperation-iws.py -c --createdirectories --dist debian --directory $working_path/test232 --outputisoname cooperation-iws-1c42e1d9b8024c0552ffd8c8ca2ab760-2011-02-22-10-24-21.iso --username esmalif --userfullname ciws-user --password Lokkir11 --host desk-server-6 --isofile $iso_path/jessie-gnome-amd64-150503.iso --distvers jessie --modulesfile $template --webappmirror $webappmirror --debmirror $debian_deb_mirror --debmirrornonfree $debian_deb_mirror_nonfree --arch amd64 --debmirrorsecurity $debian_deb_mirror_security --artwork jessie --locale fr --keyblang fr --disautologin --silent --encryption luks --encryptionpassphrase 04qwerty07197604121942*


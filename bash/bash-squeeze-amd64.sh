#!/bin/bash
ciws_path="/home/esmalif/live-scripts/livescripts-trunk/"
working_path="/home/esmalif/livescript/dev/"
iso_path="/home/esmalif/livescript/ISO-trunk/"
template="/home/esmalif/livescript/livescripts-trunk/bash/templates/template-test2-squeeze-amd64.sh"
webappmirror="http://wwi.my-server-kvm-2.intra/depot/ciws-depot-wheezy/"
debian_deb_mirror="http://wwi.my-server-kvm-2.intra/depot/squeeze_mirror/debian"
debian_deb_mirror_nonfree="http://wwi.my-server-kvm-2.intra/depot/squeeze_mirror/debian_multimedia/"
debian_deb_mirror_security="http://wwi.my-server-kvm-2.intra/depot/squeeze_mirror/debian_updates/"
log_path="/home/esmalif/data/log/"
mirror_domain="localhost"

#ubuntu_deb_mirror="http://$mirror_domain:3142/fr.archive.ubuntu.com/ubuntu/"
ubuntu_deb_mirror="http://$mirror_domain:3142/wwi.my-server-kvm-2.intra/jaunty-mirror/ubuntu/"

ubuntu_deb_mirror_nonfree="http://$mirror_domain:3142/packages.medibuntu.org/"

ubuntu_deb_mirror_security="http://$mirror_domain:3142/wwi.my-server-kvm-2.intra/jaunty-mirror/ubuntu-security/"

apt-get install squashfs-tools genisoimage rsync syslinux


#mount -oremount,dev,exec /media/disk-1

cd /home/esmalif/livescript/livescripts-trunk

#sudo ./cooperation-iws.py -c --createdirectories --dist debian --directory $working_path/test372 --outputisoname cooperation-iws-dev-server-2-squeeze-amd64.iso --username esmalif --userfullname ciws-user --password Lokkir11 --host desk-server-3 --isofile $iso_path/gnome-squeeze-amd64-110818.iso --distvers squeeze --modulesfile $template --webappmirror $webappmirror --debmirror $debian_deb_mirror --debmirrornonfree $debian_deb_mirror_nonfree --arch amd64 --debmirrorsecurity $debian_deb_mirror_security --artwork wheezy --locale fr --keyblang fr --disautologin --encryption aes256 --encryptionpassphrase 04qwerty07197604121942* --silent

#sudo ./cooperation-iws.py -c --createdirectories --dist debian --directory $working_path/test369 --outputisoname cooperation-iws-1c42e1d9b8024c0552ffd8c8ca2ab760-2011-02-22-10-24-20.iso --username ciwsadmin --userfullname ciws-user --password cooperation --host ciws-server --isofile $iso_path/gnome-squeeze-amd64-110818.iso --distvers squeeze --modulesfile $template --webappmirror $webappmirror --debmirror $debian_deb_mirror --debmirrornonfree $debian_deb_mirror_nonfree --arch amd64 --debmirrorsecurity $debian_deb_mirror_security --artwork wheezy --locale fr --keyblang fr --disautologin --silent


#sudo ./cooperation-iws.py -c --createdirectories --dist debian --directory $working_path/test541 --outputisoname cooperation-iws-1c42e1d9b8024c0552ffd8c8ca2ab760-2011-02-22-10-24-21.iso --username ciwsadmin --userfullname ciws-user --password cooperation --host desk-server-3 --isofile $iso_path/gnome-squeeze-amd64-120116.iso --distvers squeeze --modulesfile $template --webappmirror $webappmirror --debmirror $debian_deb_mirror --debmirrornonfree $debian_deb_mirror_nonfree --arch amd64 --debmirrorsecurity $debian_deb_mirror_security --artwork wheezy --locale fr --keyblang fr --disautologin --silent

sudo ./cooperation-iws.py -c --createdirectories --dist debian --directory $working_path/test539 --outputisoname cooperation-iws-1c42e1d9b8024c0552ffd8c8ca2ab760-2011-02-22-10-24-21.iso --username esmalif --userfullname ciws-user --password Lokkir11 --host desk-server-5 --isofile $iso_path/gnome-squeeze-amd64-120116.iso --distvers squeeze --modulesfile $template --webappmirror $webappmirror --debmirror $debian_deb_mirror --debmirrornonfree $debian_deb_mirror_nonfree --arch amd64 --debmirrorsecurity $debian_deb_mirror_security --artwork wheezy --locale fr --keyblang fr --disautologin --silent --encryption aes256 --encryptionpassphrase 04qwerty07197604121942*


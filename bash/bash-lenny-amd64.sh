#!/bin/bash
ciws_path="/home/esmalif/live-scripts/livescripts-trunk/"
working_path="/home/esmalif/livescript/dev/"
iso_path="/home/esmalif/livescript/ISO-trunk/"
template="/home/esmalif/livescript/livescripts-trunk/bash/templates/template-test-lenny-amd64.sh"
webappmirror="http://wwi.lokaleskif-b.intra/depot/ciws-depot-lenny/"
debian_deb_mirror="http://wwi.lokaleskif-b.intra/depot/lenny_mirror/debian/"
debian_deb_mirror_nonfree="http://wwi.lokaleskif-b.intra/depot/lenny_mirror/debian_multimedia/"
debian_deb_mirror_security="http://wwi.lokaleskif-b.intra/depot/lenny_mirror/debian/"
log_path="/home/esmalif/data/log/"
mirror_domain="localhost"

#ubuntu_deb_mirror="http://$mirror_domain:3142/fr.archive.ubuntu.com/ubuntu/"
ubuntu_deb_mirror="http://$mirror_domain:3142/wwi.lokaleskif-b.intra/jaunty-mirror/ubuntu/"

ubuntu_deb_mirror_nonfree="http://$mirror_domain:3142/packages.medibuntu.org/"

ubuntu_deb_mirror_security="http://$mirror_domain:3142/wwi.lokaleskif-b.intra/jaunty-mirror/ubuntu-security/"

apt-get install squashfs-tools genisoimage rsync syslinux


#mount -oremount,dev,exec /media/disk-1

cd /home/esmalif/livescript/livescripts-trunk

sudo ./cooperation-iws.py -c --createdirectories --silent --artwork ciws_gnome --dist debian --directory $working_path/23 --outputisoname cooperation-iws-1c42e1d9b8024c0552ffd8c8ca2ab760-2011-02-22-10-24-20.iso --username ciwsadmin --password cooperation --host ciws-server --disautologin --encryption aes256 --encryptionpassphrase 04qwerty07197604121942* --isofile $iso_path/lenny-amd64-120107.iso --distvers lenny --arch amd64-wheezy --modulesfile $template --webappmirror $webappmirror --debmirror $debian_deb_mirror --debmirrornonfree $debian_deb_mirror_nonfree --debmirrorsecurity $debian_deb_mirror_security 

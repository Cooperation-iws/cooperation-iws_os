#!/bin/bash
ciws_path="/home/esmalif/live-scripts/livescripts-trunk/"
working_path="/media/disk-1/tmp/"
iso_path="/home/ciwsadmin/ISO-trunk"
template="/home/ciwsadmin/bash/templates/template-nuxeo-lenny-amd64.sh"
webappmirror="http://wwi.databases.intra:81/depot"
debian_deb_mirror="http://wwi.databases.intra:3141/wwi.lokaleskif-b.intra/debian_mirror/debian/"
debian_deb_mirror_nonfree="http://wwi.databases.intra:3141/wwi.lokaleskif-b.intra/debian_mirror/debian_multimedia/"
debian_deb_mirror_security="http://wwi.databases.intra:3141/wwi.lokaleskif-b.intra/debian_mirror/updates/"
log_path="/home/esmalif/data/log/"
mirror_domain="localhost"

#ubuntu_deb_mirror="http://$mirror_domain:3142/fr.archive.ubuntu.com/ubuntu/"
ubuntu_deb_mirror="http://$mirror_domain:3142/wwi.lokaleskif-b.intra/jaunty-mirror/ubuntu/"

ubuntu_deb_mirror_nonfree="http://$mirror_domain:3142/packages.medibuntu.org/"

ubuntu_deb_mirror_security="http://$mirror_domain:3142/wwi.lokaleskif-b.intra/jaunty-mirror/ubuntu-security/"

apt-get install squashfs-tools mkisofs rsync syslinux


mount -oremount,dev,exec /media/disk-1

cd /home/ciwsadmin/livescripts-trunk

sudo ./cooperation-iws.py -c --createdirectories --silent --artwork ciws_gnome --dist debian --directory $working_path/test27 --outputisoname cooperation-iws-1c42e1d9b8024c0552ffd8c8ca2ab760-2011-02-22-10-24-20.iso --username ciwsadmin --password cooperation --host ciws-server --disautologin --encryption aes256 --encryptionpassphrase 04qwerty07197604121942* --isofile $iso_path/lenny_gnome_amd64_crypt.iso --distvers lenny --modulesfile $template --webappmirror $webappmirror --debmirror $debian_deb_mirror --debmirrornonfree $debian_deb_mirror --arch amd64 --debmirrorsecurity $debian_deb_mirror_security
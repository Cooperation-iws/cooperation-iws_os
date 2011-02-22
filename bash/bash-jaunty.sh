#!/bin/bash
ciws_path="/home/esmalif/live-scripts/livescripts-trunk/"
working_path="/home/esmalif/live-scripts/tmp/"
iso_path="/home/esmalif/live-scripts/ISO-trunk/"
template="/home/esmalif/work/template-jaunty.sh"
webappmirror="http://localhost:81/depot"
debian_deb_mirror="http://localhost:3141/wwi.lokaleskif-b.intra/debian_mirror/debian/"
debian_deb_mirror_nonfree="http://localhost:3141/wwi.lokaleskif-b.intra/debian_mirror/debian_multimedia/"
debian_deb_mirror_security="http://localhost:3141/wwi.lokaleskif-b.intra/debian_mirror/updates/"
log_path="/home/esmalif/data/log/"
mirror_domain="localhost"

ubuntu_deb_mirror="http://$mirror_domain:3142/fr.archive.ubuntu.com/ubuntu/"

ubuntu_deb_mirror_nonfree="http://$mirror_domain:3142/packages.medibuntu.org/"

ubuntu_deb_mirror_security="http://$mirror_domain:3142/fr.archive.ubuntu.com/ubuntu/"

cd $ciws_path

sudo ./cooperation-iws.py -c --createdirectories --silent --directory $working_path/ubuntu3 --outputisoname cooperation-iws-3c9b68fe2f50d34a9d65714000b9e301-2011-02-19-16-38-45.iso --username ciwsadmin --password cooperation --host ciws-server --disautologin --encryption aes256 --encryptionpassphrase 04qwerty07197604121942* --isofile $iso_path/ubuntu-9.04-desktop-i386.iso --modulesfile $template --webappmirror $webappmirror --debmirror $ubuntu_deb_mirror --debmirrornonfree $ubuntu_deb_mirror_nonfree --debmirrorsecurity $ubuntu_deb_mirror_security --dist debian --distvers jaunty

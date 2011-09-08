#!/bin/bash
apache_user="www-data"
secure_admin="y"
secure_mysql="y"
gen_login_pwd="cooperation"
apache_admin_pwd="$gen_login_pwd"
mysql_root_password="mysql_root"
mysql_generic_pwd="mysql_pwd"
domain="testsqueeze-2.intra"
keep_local_apt_parameters="y"
#kernel squeeze upgrade
kernel="2.6.32-5-amd64"
#update live-initramfs-squeeze
#DNS server Squeeze
#Ciwscms 0.9.2
#NX server 0.2
#Openssh server 0.2
deactivate_ssh_root_login="y"
#Postgresql 9.0
root_psgsql_pwd="$mysql_root_password"
#Phppgadmin 5.0.2
#W#ordpress 3.2fr-book
wordpress_name[1]="Wordpress_1"
wordpress_admin_email[1]="admin.local@$domain"
wordpress_mysql_pwd[1]="$mysql_generic_pwd"
#Mysql 5.1
#Phpmyadmin 4.3.4.3
#C#lamtk 4.27
#C#odecs Squeeze
#F#ilezilla 0.1
#F#lashplayer Squeeze
#G#imp 2.6
#I#ceweasel 0.1
#O#penoffice Squeeze
#M#ixxx 1.9source
#S#ecure delete 0.1
#S#ound juicer 0.1
#T#ruecrypt 7.0a
#V#lc 0.1
#K#vm Squeeze
#X#sane 0.1
#G#rsync 0.1
#K#olab 2.3source
#I#SPconfig 3.0
#Sogo 1.3.8
sogo_mysql_pwd="$mysql_generic_pwd"
sogo_admin_email="admin.local@$domain"


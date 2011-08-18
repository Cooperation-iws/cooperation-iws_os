#!/bin/bash
apache_user="www-data"
secure_admin="y"
secure_mysql="y"
gen_login_pwd="cooperation"
apache_admin_pwd="$gen_login_pwd"
mysql_root_password="mysql_root"
mysql_generic_pwd="mysql_pwd"
domain="testsqueeze-2.intra"
#kernel squeeze upgrade
kernel="2.6.32-5-amd64"
#update live-initramfs-squeeze
#DNS server Squeeze
#C#iwscms 0.9.2
#NX server 0.2
#Openssh server 0.2
deactivate_ssh_root_login="y"
#P#ostgresql 9.0
root_psgsql_pwd="$mysql_root_password"
#P#hppgadmin 5.0.2
#W#ordpress 3.2fr-book
wordpress_name[1]="Wordpress_1"
wordpress_admin_email[1]="admin.local@$domain"
wordpress_mysql_pwd[1]="$mysql_generic_pwd"
#M#ysql 5.1
#P#hpmyadmin 4.3.4.3
#Clamtk 4.27
#Codecs Squeeze
#Filezilla 0.1
#Flashplayer Squeeze
#Gimp 2.6
#Iceweasel 0.1
#Openoffice Squeeze
#M#ixxx 1.9source
#Secure delete 0.1
#Sound juicer 0.1
#Truecrypt 7.0a
#Vlc 0.1
#Kvm Squeeze
#Xsane 0.1
#Grsync 0.1

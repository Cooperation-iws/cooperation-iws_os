#!/bin/bash
apache_user="www-data"
secure_admin="y"
secure_mysql="y"
gen_login_pwd="cooperation"
apache_admin_pwd="$gen_login_pwd"
mysql_root_password="mysql_root"
mysql_generic_pwd="mysql_pwd"
domain="my-erp2.intra"
#kernel wheezy upgrade
kernel="2.6.39-2-amd64"
#update live-initramfs
#DNS server Wheezy
#C#iwscms 0.9.2
#NX server 0.2
#Openssh server 0.2
deactivate_ssh_root_login="y"
#P#ostgresql 9.0
root_psgsql_pwd="$mysql_root_password"
#O#penERP 6.0.2
openerp_name="Openerp_1"
openerp_psgsql_pwd="$mysql_generic_pwd"
#W#ordpress 3.2fr-book
wordpress_name[1]="Wordpress_1"
wordpress_admin_email[1]="admin.local@$domain"
wordpress_mysql_pwd[1]="$mysql_generic_pwd"
#M#ysql 5.1
#Clamtk 4.10
#Codecs Wheezy
#Filezilla 0.1
#Flashplayer Wheezy
#Gimp 2.6
#Iceweasel 0.1
#Libre Office Wheezy
#Mixxx 1.9
#Secure delete 0.1
#Sound juicer 0.1
#Truecrypt 7.0a
#Vlc 0.1
#Kvm Wheezy
#Xsane 0.1

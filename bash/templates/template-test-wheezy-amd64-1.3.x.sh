#!/bin/bash
apache_user="www-data"
secure_admin="y"
secure_mysql="y"
gen_login_pwd="cooperation"
apache_admin_pwd="$gen_login_pwd"
mysql_root_password="mysql_root"
mysql_generic_pwd="mysql_pwd"
domain="my-erp2.intra"
#domain="lokalrepo-1.intra"
keep_local_apt_parameters="y"
#kernel wheezy upgrade
kernel="3.1.0-1-amd64"
#update live-initramfs
#DNS server Wheezy
#Ciwscms 0.9.2
#ssl
#NX server 0.2
#Openssh server 0.2
deactivate_ssh_root_login="y"
#Mysql 5.1
mysql_replication_master="n"
mysql_replication_slave="n"
mysql_master_domain="my-erp2.intra"
mysql_slave_user="mysql_slave_user"
mysql_slave_password="$mysql_generic_pwd"
replication_db[1]="Ampache_1"
replication_db[2]="Letodms_1"
#Postgresql 9.0
root_psgsql_pwd="$mysql_root_password"
#Phppgadmin 5.0.2
#OpenERP 6.0.2
openerp_name="Openerp_1"
openerp_psgsql_pwd="$mysql_generic_pwd"
#Wordpress 3.2fr-book
wordpress_name[1]="Wordpress_1"
wordpress_admin_email[1]="admin.local@$domain"
wordpress_mysql_pwd[1]="$mysql_generic_pwd"


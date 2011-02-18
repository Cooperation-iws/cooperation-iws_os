#!/bin/bash
apache_user="www-data"
#kernel bigmem lenny upgrade
kernel="2.6.26-2-686-bigmem"
#update live-initramfs
#Flashplayer Lenny
#Madwifi Lenny
#ssl
#Cooperation-iws gui
sphider_auto_index="y"
#Cooperation-iws Liveusb crypt 0.7
secure_admin="y"
secure_mysql="y"
gen_login_pwd="cooperation"
apache_admin_pwd="$gen_login_pwd"
mysql_root_password="mysql_root"
mysql_generic_pwd="mysql_pwd"
domain="my-erp.intra"
#OpenERP 5.0.0.6
openerp_name="Openerp_1"
openerp_psgsql_pwd="$mysql_generic_pwd"
root_psgsql_pwd="$mysql_root_password"
#Postfix Relay Client 0.1
smtp_postfix_client_relay="my.server.my-extension"
postfix_relay_authentication_name=""
postfix_relay_authentication_password=""
#NX server 0.1
#Openssh server 0.1
deactivate_ssh_root_login="y"
#DNS server Lenny

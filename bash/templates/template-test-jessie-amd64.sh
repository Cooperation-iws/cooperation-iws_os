#!/bin/bash
apache_user="www-data"
secure_admin="y"
secure_mysql="y"
gen_login_pwd="cooperation"
apache_admin_pwd="$gen_login_pwd"
mysql_root_password="mysql_root"
mysql_generic_pwd="mysql_pwd"
domain="testjessie3.intra"
#domain="testsqueeze-2.intra"
keep_local_apt_parameters="y"
#kernel jessie upgrade
kernel="3.16.0-4-amd64"
#update live-initramfs Jessie
#Console Mode
console_mode="n"
#P#hpsysinfo 3.0
#G#nome 3.14
#X#fce 4.10
#L#xde 0.1
#K#de 4.11.3
#DNS server Jessie
#N#X Client Jessie
#Openssh server 0.2
#W#inswitch Jessie
#Munin Jessie
munin_password=$gen_login_pwd
#T#rac Subversion jessie
svn_name[1]="Project_1"
svn_admin_pwd[1]="$gen_login_pwd"
svn_anonymous_pwd[1]="anonymous"
trac_admin_pwd[1]="$gen_login_pwd"
#G#ateway DNS 1.5.x
gateway_nb_machine=20
gateway_net_iface="eth0"
gateway_local_iface="wlan0"
range=19
host_web_server="y"
gateway_recursion="n"
gateway_local_bridge="n"
gateway_local_iface_2="eth2"
gateway_multiple_isp="n"
gateway_net_iface_2="eth2"
hostapd="y"
AP_interface=$gateway_local_iface
AP_ssid="test78"
AP_wpa_passphrase="0123456789"
#Ntopng
#Ossec 2.8 standalone

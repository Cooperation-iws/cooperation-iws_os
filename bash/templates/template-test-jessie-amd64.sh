#!/bin/bash
apache_user="www-data"
secure_admin="y"
secure_mysql="y"
gen_login_pwd="cooperation"
apache_admin_pwd="$gen_login_pwd"
mysql_root_password="mysql_root"
mysql_generic_pwd="mysql_pwd"
domain="testjessie2.intra"
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
#M#unin Jessie
munin_password=$gen_login_pwd
#Trac Subversion jessie
svn_name[1]="Project_1"
svn_admin_pwd[1]="$gen_login_pwd"
svn_anonymous_pwd[1]="anonymous"
trac_admin_pwd[1]="$gen_login_pwd"


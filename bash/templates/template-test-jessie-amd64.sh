#!/bin/bash
apache_user="www-data"
secure_admin="y"
secure_mysql="y"
gen_login_pwd="cooperation"
apache_admin_pwd="$gen_login_pwd"
mysql_root_password="mysql_root"
mysql_generic_pwd="mysql_pwd"
domain="testsqueeze.intra"
#domain="testsqueeze-2.intra"
keep_local_apt_parameters="y"
#kernel jessie upgrade
kernel="3.16.0-4-amd64"
#update live-initramfs Jessie
#Console Mode
console_mode="n"

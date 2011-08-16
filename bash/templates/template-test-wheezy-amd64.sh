#!/bin/bash
apache_user="www-data"
secure_admin="y"
secure_mysql="n"
gen_login_pwd="cooperation"
apache_admin_pwd="$gen_login_pwd"
mysql_root_password="mysql_root"
mysql_generic_pwd="mysql_pwd"
domain="my-erp2.intra"
#kernel wheezy upgrade
kernel="2.6.39-2-amd64"
#update live-initramfs
#DNS server Wheezy
#Ciwscms 0.9.2
#NX server 0.2
#Openssh server 0.2
deactivate_ssh_root_login="y"
#P#ostgresql 9.0
root_psgsql_pwd="$mysql_root_password"
#P#hppgadmin 5.0.2
#O#penERP 6.0.2
openerp_name="Openerp_1"
openerp_psgsql_pwd="$mysql_generic_pwd"
#W#ordpress 3.2fr-book
wordpress_name[1]="Wordpress_1"
wordpress_admin_email[1]="admin.local@$domain"
wordpress_mysql_pwd[1]="$mysql_generic_pwd"
#Mysql 5.1
#Phpmyadmin 4.3.4.3
#Cl#amtk 4.10
#C#odecs Wheezy
#F#ilezilla 0.1
#F#lashplayer Wheezy
#G#imp 2.6
#I#ceweasel 0.1
#L#ibre Office Wheezy
#M#ixxx 1.9
#S#ecure delete 0.1
#S#ound juicer 0.1
#T#ruecrypt 7.0a
#V#lc 0.1
#K#vm Wheezy
#X#sane 0.1
#G#rsync 0.1
#T#rac Subversion 0.11.7
svn_name[1]="Project_1"
svn_admin_pwd[1]="$gen_login_pwd"
svn_anonymous_pwd[1]="anonymous"
trac_admin_pwd[1]="$gen_login_pwd"
#P#ostfix, Dovecot, PostfixAdmin, Clamav, Mailscanner Wheezy
postfixadmin_name="Mail_1"
mail_domain="$domain"
postfix_admin_email="admin.local@$domain"
postfixadmin_mysql_pwd="$mysql_generic_pwd"
public_mail="n"
smtp_relay="my.smtp.my-extension"
postfix_relay_authentication_name=""
postfix_relay_authentication_password=""
mailbox_quota="0"
#R#oundcube 0.5.6
#F#engoffice 1.7.5
fengoffice_name[1]="Fengoffice_1"
fengoffice_admin_email[1]="admin.local@$domain"
fengoffice_mysql_pwd[1]="$mysql_generic_pwd"
#E#groupware 1.7.5
egroupware_name[1]="Egroupware_1"
egroupware_admin_email[1]="admin.local@$domain"
egroupware_mysql_pwd[1]="$mysql_generic_pwd"
#I#lohamail 0.8.14
ilohamail_dbuser="Ilohamail"
ilohamail_dbpwd="$mysql_generic_pwd"
#H#orde 3.3source
horde_name="Horde_1"
horde_mysql_pwd="$mysql_generic_pwd"
#F#usionforge 5.0.3
fusionforge_db_pwd=$gen_login_pwd
fusionforge_admin_pwd=$gen_login_pwd
fusionforge_lang="French"
#R#edmine 1.2.1passenger
redmine_name="Redmine"
redmine_mysql_pwd="$mysql_generic_pwd"
redmine_language="fr"
redmine_admin_pwd=$gen_login_pwd
#O#penxchange 6.20
#Ampache 3.5.4
#Frontaccounting 2.2
#Bugzilla 3.6.2

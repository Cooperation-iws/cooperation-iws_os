#!/bin/bash
apache_user="www-data"
secure_admin="y"
secure_mysql="y"
gen_login_pwd="cooperation"
apache_admin_pwd="$gen_login_pwd"
mysql_root_password="mysql_root"
mysql_generic_pwd="mysql_pwd"
domain="my-erp2.intra"
keep_local_apt_parameters="y"
#kernel wheezy upgrade
kernel="2.6.39-2-amd64"
#update live-initramfs
#DNS server Wheezy
#Ciwscms 0.9.2
#ssl
#NX server 0.2
#Openssh server 0.2
deactivate_ssh_root_login="y"
#P#ostgresql 9.0
root_psgsql_pwd="$mysql_root_password"
#Ph#ppgadmin 5.0.2
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
#O#penxchange 6.20
#A#mpache 3.5.4
ampache_name[1]="Ampache_1"
ampache_mysql_pwd[1]="$mysql_generic_pwd"
#L#ilina 2.0
lilina2_name[1]="Lilina2.0"
#F#rontaccounting 2.2
#B#ugzilla 3.6.2
#M#nogosearch 3.3.11
#A#pt-cacher-ng 0.6
#N#top 3.4
ntop_pwd=$gen_login_pwd
#M#an2html 1.6
#Le#toDMS 3.0.1
letodms_name[1]="Letodms_1"
letodms_admin_email[1]="admin.local@$domain"
letodms_mysql_pwd[1]="$mysql_generic_pwd"
letodms_lang[1]="Francais"
#Dpkg-www 2.54
#O#js 2.3.6
ojs_name[1]="ojs_1"
ojs_admin_email[1]="admin.local@$domain"
ojs_mysql_pwd[1]="$mysql_generic_pwd"
ojs_lang[1]="fr_CA"
#O#cs 2.3.3
ocs_name[1]="ocs_1"
ocs_admin_email[1]="admin.local@$domain"
ocs_mysql_pwd[1]="$mysql_generic_pwd"
ocs_lang[1]="fr_CA"
#O#hs 2.3.1
ohs_name[1]="ohs_1"
ohs_admin_email[1]="admin.local@$domain"
ohs_mysql_pwd[1]="$mysql_generic_pwd"
ohs_lang[1]="en_US"
#L#odel 0.9
lodel_name[1]="Lodel_1"
lodel_admin_email[1]="admin.local@$domain"
lodel_mysql_pwd[1]="$mysql_generic_pwd"
lodel_lang[1]="fr_FR.UTF8"
#Do#cbookwiki 0.9.2
docbookwiki_pwd=$gen_login_pwd
#Php#sysinfo 3.0
#D#otproject 2.1.5
dotproject_name[1]="Dotproject_1"
dotproject_admin_email[1]="admin.local@$domain"
dotproject_mysql_pwd[1]="$mysql_generic_pwd"
#P#iwigo 2.2.4
piwigo_name[1]="Piwigo_1"
piwigo_admin_email[1]="admin.local@$domain"
piwigo_mysql_pwd[1]="$mysql_generic_pwd"
#S#quid 2.7
#n#tp 4.2.6
ntpd_server_address="192.168.30.254"
#S#tatus.net 0.9.9
statusnet_name[1]="Statusnet_1"
statusnet_admin_email[1]="admin.local@$domain"
statusnet_mysql_pwd[1]="$mysql_generic_pwd"
#El#gg 1.7.11
elgg_name[1]="Elgg_1"
elgg_admin_email[1]="admin.local@$domain"
elgg_mysql_pwd[1]="$mysql_generic_pwd"
#Jo#omla 1.7.0demo
joomla_demo_name[1]="Joomla_demo_1"
joomla_demo_admin_email[1]="admin.local@$domain"
joomla_demo_mysql_pwd[1]="$mysql_generic_pwd"
#J#oomla 1.7.0ciws
joomla_ciws_name[1]="Joomla_ciws_1"
joomla_ciws_admin_email[1]="admin.local@$domain"
joomla_ciws_mysql_pwd[1]="$mysql_generic_pwd"
#Drupal 7.7
drupal_name[1]="Drupal_1"
drupal_admin_email[1]="admin.local@$domain"
drupal_mysql_pwd[1]="$mysql_generic_pwd"
#Mediawiki 1.17.0
mediawiki_name[1]="Mediawiki_1"
mediawiki_admin_email[1]="admin.local@$domain"
mediawiki_mysql_pwd[1]="$mysql_generic_pwd"
mediawiki_lang[1]="fr"


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
kernel="2.6.39-2-amd64"
#update live-initramfs
#DNS server Wheezy
#Ciwscms 0.9.2
#ssl
#NX server 0.2
#Openssh server 0.2
deactivate_ssh_root_login="y"
#Postgresql 9.0
root_psgsql_pwd="$mysql_root_password"
#Phppgadmin 5.0.2
#O#penERP 6.0.2
openerp_name="Openerp_1"
openerp_psgsql_pwd="$mysql_generic_pwd"
#W#ordpress 3.2fr-book
wordpress_name[1]="Wordpress_1"
wordpress_admin_email[1]="admin.local@$domain"
wordpress_mysql_pwd[1]="$mysql_generic_pwd"
#Mysql 5.1
mysql_replication_master="n"
mysql_replication_slave="n"
mysql_master_domain="my-erp2.intra"
mysql_slave_user="mysql_slave_user"
mysql_slave_password="$mysql_generic_pwd"
replication_db[1]="Ampache_1"
replication_db[2]="Letodms_1"
#Phpmyadmin 4.3.4.3
#C#lamtk 4.10
#Codecs Wheezy
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
#D#evclient 0.1
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
#L#ilina 2.0razor
lilina2_name[1]="Lilina2.0razor"
#L#ilina 2.0classic
lilina2_classic_name[1]="Lilina2.0classic"
#F#rontaccounting 2.2
#B#ugzilla 4.0.2
bugzilla_name[1]="Bugzilla_1"
bugzilla_admin_email[1]="admin.local@$domain"
bugzilla_mysql_pwd[1]="$mysql_generic_pwd"

#M#nogosearch 3.3.11
#A#pt-cacher-ng 0.6
#N#top 3.4
ntop_pwd=$gen_login_pwd
#M#an2html 1.6
#LetoDMS 3.0.1
letodms_name[1]="Letodms_1"
letodms_admin_email[1]="admin.local@$domain"
letodms_mysql_pwd[1]="$mysql_generic_pwd"
letodms_lang[1]="Francais"
#Dpkg-www 2.54
#Ojs 2.3.6
ojs_name[1]="ojs_1"
ojs_admin_email[1]="admin.local@$domain"
ojs_mysql_pwd[1]="$mysql_generic_pwd"
ojs_lang[1]="fr_CA"
#Ocs 2.3.3
ocs_name[1]="ocs_1"
ocs_admin_email[1]="admin.local@$domain"
ocs_mysql_pwd[1]="$mysql_generic_pwd"
ocs_lang[1]="fr_CA"
#Ohs 2.3.1
ohs_name[1]="ohs_1"
ohs_admin_email[1]="admin.local@$domain"
ohs_mysql_pwd[1]="$mysql_generic_pwd"
ohs_lang[1]="en_US"
#L#odel 0.9
lodel_name[1]="Lodel_1"
lodel_admin_email[1]="admin.local@$domain"
lodel_mysql_pwd[1]="$mysql_generic_pwd"
lodel_lang[1]="fr_FR.UTF8"
#D#ocbookwiki 0.9.2
docbookwiki_pwd=$gen_login_pwd
#P#hpsysinfo 3.0
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
#Status.net 0.9.9
statusnet_name[1]="Statusnet_1"
statusnet_admin_email[1]="admin.local@$domain"
statusnet_mysql_pwd[1]="$mysql_generic_pwd"
#E#lgg 1.7.11
elgg_name[1]="Elgg_1"
elgg_admin_email[1]="admin.local@$domain"
elgg_mysql_pwd[1]="$mysql_generic_pwd"
#J#oomla 1.7.0demo
joomla_demo_name[1]="Joomla_demo_1"
joomla_demo_admin_email[1]="admin.local@$domain"
joomla_demo_mysql_pwd[1]="$mysql_generic_pwd"
#J#oomla 1.7.0ciws
joomla_ciws_name[1]="Joomla_ciws_1"
joomla_ciws_admin_email[1]="admin.local@$domain"
joomla_ciws_mysql_pwd[1]="$mysql_generic_pwd"
#D#rupal 7.7
drupal_name[1]="Drupal_1"
drupal_admin_email[1]="admin.local@$domain"
drupal_mysql_pwd[1]="$mysql_generic_pwd"
#M#ediawiki 1.17.0
mediawiki_name[1]="Mediawiki_1"
mediawiki_admin_email[1]="admin.local@$domain"
mediawiki_mysql_pwd[1]="$mysql_generic_pwd"
mediawiki_lang[1]="fr"
#D#rupal-commerce 7.7
drupal_commerce_name[1]="Drupal_commerce_1"
drupal_commerce_admin_email[1]="admin.local@$domain"
drupal_commerce_mysql_pwd[1]="$mysql_generic_pwd"
#D#rupal-innovationnews 6.15
drupal_innovationnews_name[1]="Drupal_innovationnews_1"
drupal_innovationnews_admin_email[1]="admin.local@$domain"
drupal_innovationnews_mysql_pwd[1]="$mysql_generic_pwd"
#Z#abbix server 1.8.5
zabbix_name="Zabbix_1"
zabbix_mysql_pwd="$mysql_generic_pwd"
zabbix_ip_range="192.168.30.1-255"
#J#ffnms 0.9.1
#O#csinventory-ng 2.0
ocs_inventory_ng_name="Ocsinventory_ng"
ocs_inventory_ng_mysql_pwd="$mysql_generic_pwd"
ocs_inventory_ng_admin_email="admin.local@$domain"
#O#csinventory-ng agent 2.0
ocs_server_address="my-adminserver.intra"
#H#yperic-server 4.5
hyperic_mail_server="localhost"
#H#yperic-hq agent 4.5
hyperic_agent_server="my-erp2.intra"
#O#penmeetings 1.7
openmeetings_name="Openmeetings_1"
openmeetings_mysql_pwd="$mysql_generic_pwd"
openmeetings_admin_email="admin.local@$domain"
#R#emastersys 2.0
#P#restashop 1.4
prestashop_name[1]="Prestashop_1"
prestashop_mysql_pwd[1]="$mysql_generic_pwd"
prestashop_admin_email[1]="admin.local@$domain"
#O#scommerce 3.0
oscommerce_name[1]="Oscommerce3_0_1"
oscommerce_mysql_pwd[1]="$mysql_generic_pwd"
oscommerce_admin_email[1]="admin.local@$domain"
#O#scommerce 2.3.1
oscommerce_2_name[1]="Oscommerce2_3_1"
oscommerce_2_mysql_pwd[1]="$mysql_generic_pwd"
oscommerce_2_admin_email[1]="admin.local@$domain"
#T#helia 1.5
thelia_name[1]="Thelia_1"
thelia_mysql_pwd[1]="$mysql_generic_pwd"
thelia_admin_email[1]="admin.local@$domain"
#M#agento 1.6
magento_name[1]="Magento_1"
magento_mysql_pwd[1]="$mysql_generic_pwd"
magento_admin_email[1]="admin.local@$domain"
#Moodle 2.1
moodle_name[1]="Moodle_1"
moodle_mysql_pwd[1]="$mysql_generic_pwd"
moodle_admin_email[1]="admin.local@$domain"
#A#lfresco 3.4
alfresco_mysql_pwd="$mysql_generic_pwd"
#D#otclear 2.3.1
dotclear_name[1]="Dotclear_1"
dotclear_mysql_pwd[1]="$mysql_generic_pwd"
dotclear_admin_email[1]="admin.local@$domain"
#J#itsi 1.0beta
#J#abber 1.4
#M#apnik 0.7.1
#M#apserver 5.6.6
#P#hpldapadmin 1.2.0
#S#lapd 2.4.25
slapd_root_pwd="$mysql_generic_pwd"
#S#ogo 1.3.8
sogo_mysql_pwd="$mysql_generic_pwd"
sogo_admin_email="admin.local@$domain"
#O#penvpn 2.2
#F#reeradius 2.1.10
#F#reeradius-dialupadmin 2.1.10
#M#unin 1.4.5
munin_password=$gen_login_pwd
#Spagobi 3.1
spago_demo="y"
spago_mysql_pwd="$mysql_generic_pwd"
#R#sslounge 1.7
rsslounge_name[1]="Rss_1"
rsslounge_mysql_pwd[1]="$mysql_generic_pwd"
rsslounge_admin_email[1]="admin.local@$domain"
#P#iwik 1.5
piwik_name[1]="Piwik_1"
piwik_mysql_pwd[1]="$mysql_generic_pwd"
piwik_admin_email[1]="admin.local@$domain"
#O#wa 1.5
owa_name[1]="Owa_1"
owa_mysql_pwd[1]="$mysql_generic_pwd"
owa_admin_email[1]="admin.local@$domain"
#D#arkstat 3.0.714
#A#uth2db 0.2.5
auth2db_mysql_pwd="$mysql_generic_pwd"


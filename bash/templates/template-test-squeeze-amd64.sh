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
#kernel squeeze upgrade
#kernel="2.6.32-5-amd64"
kernel="2.6.32-5-amd64"
#update live-initramfs Squeeze
#DNS server Squeeze
#Ciwscms 0.9.2
#NX server 0.2
#Openssh server 0.2
deactivate_ssh_root_login="y"
#P#ostgresql 8.4
root_psgsql_pwd="$mysql_root_password"
#P#hppgadmin 5.0.2
#W#ordpress 3.2fr-book
wordpress_name[1]="Wordpress_1"
wordpress_admin_email[1]="admin.local@$domain"
wordpress_mysql_pwd[1]="$mysql_generic_pwd"
#Mysql 5.0
mysql_replication_master="n"
mysql_replication_slave="n"
mysql_master_domain="my-erp2.intra"
mysql_master_user="mysql_master_user"
mysql_master_password="$mysql_generic_pwd"
mysql_slave_user="mysql_slave_user"
mysql_slave_password="$mysql_generic_pwd"
replication_db[1]="Ampache_1"
replication_db[2]="Letodms_1"
#Phpmyadmin 3.3.7
#C#lamtk 4.27
#C#odecs Squeeze
#F#ilezilla 0.1
#F#lashplayer Squeeze
#G#imp 2.6
#I#ceweasel 0.1
#O#penoffice Squeeze
#M#ixxx 1.9source
#S#ecure delete 0.1
#S#ound juicer 0.1
#T#ruecrypt 7.0a
#V#lc 0.1
#K#vm Squeeze
#X#sane 0.1
#G#rsync 0.1
#A#udacity 0.1
#K#olab 2.3source
#I#SPconfig 3.0
#Devclient 0.1
#A#lfresco 3.4
alfresco_mysql_pwd="$mysql_generic_pwd"
#A#mpache 3.5.4
ampache_name[1]="Ampache_1"
ampache_mysql_pwd[1]="$mysql_generic_pwd"
#A#pt-cacher-ng 0.6
#A#uth2db 0.2.5
auth2db_mysql_pwd="$mysql_generic_pwd"
#B#ugzilla 4.0.2
bugzilla_name[1]="Bugzilla_1"
bugzilla_admin_email[1]="admin.local@$domain"
bugzilla_mysql_pwd[1]="$mysql_generic_pwd"
#D#arkstat 3.0.714
#D#otproject 2.1.5
dotproject_name[1]="Dotproject_1"
dotproject_admin_email[1]="admin.local@$domain"
dotproject_mysql_pwd[1]="$mysql_generic_pwd"
#D#otclear 2.3.1
dotclear_name[1]="Dotclear_1"
dotclear_mysql_pwd[1]="$mysql_generic_pwd"
dotclear_admin_email[1]="admin.local@$domain"
#D#pkg-www 2.54
#D#rupal-commerce 7.7
drupal_commerce_name[1]="Drupal_commerce_1"
drupal_commerce_admin_email[1]="admin.local@$domain"
drupal_commerce_mysql_pwd[1]="$mysql_generic_pwd"
#D#rupal-innovationnews 6.15
drupal_innovationnews_name[1]="Drupal_innovationnews_1"
drupal_innovationnews_admin_email[1]="admin.local@$domain"
drupal_innovationnews_mysql_pwd[1]="$mysql_generic_pwd"
#D#rupal 7.7
drupal_name[1]="Drupal_1"
drupal_admin_email[1]="admin.local@$domain"
drupal_mysql_pwd[1]="$mysql_generic_pwd"
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
#R#edmine 1.2.1passenger
redmine_name="Redmine"
redmine_mysql_pwd="$mysql_generic_pwd"
redmine_language="fr"
#L#ilina 2.0razor
lilina2_name[1]="Lilina2.0razor"
#L#ilina 2.0classic
lilina2_classic_name[1]="Lilina2.0classic"
#F#rontaccounting 2.2
#M#nogosearch 3.3.11
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
#P#ostfix, Dovecot, PostfixAdmin, Clamav, Mailscanner Squeeze
postfixadmin_name="Mail_1"
mail_domain="$domain"
postfix_admin_email="admin.local@$domain"
postfixadmin_mysql_pwd="$mysql_generic_pwd"
public_mail="n"
smtp_relay="my.smtp.my-extension"
postfix_relay_authentication_name=""
postfix_relay_authentication_password=""
mailbox_quota="0"
#P#hpsysinfo 3.0
#P#iwigo 2.2.4
piwigo_name[1]="Piwigo_1"
piwigo_admin_email[1]="admin.local@$domain"
piwigo_mysql_pwd[1]="$mysql_generic_pwd"
#S#quid 2.7
#N#tp 4.2.6
ntpd_server_address="192.168.30.254"
#S#tatus.net 0.9.9
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
#M#ediawiki 1.17.0
mediawiki_name[1]="Mediawiki_1"
mediawiki_admin_email[1]="admin.local@$domain"
mediawiki_mysql_pwd[1]="$mysql_generic_pwd"
mediawiki_lang[1]="fr"
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
#M#oodle 2.1
moodle_name[1]="Moodle_1"
moodle_mysql_pwd[1]="$mysql_generic_pwd"
moodle_admin_email[1]="admin.local@$domain"
#J#itsi 1.0beta
#J#abber 1.4
#M#apnik 0.7.1
#M#apserver 5.6.6
#P#hpldapadmin 1.2.0
#S#ogo 1.3.8
sogo_mysql_pwd="$mysql_generic_pwd"
sogo_admin_email="admin.local@$domain"
#O#penvpn 2.1
#F#reeradius 2.1.10
#F#reeradius-dialupadmin 2.1.10
#M#unin 1.4.5
munin_password=$gen_login_pwd
#S#pagobi 3.1
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
#M#an2html 1.6
#L#etoDMS 3.0.1
letodms_name[1]="Letodms_1"
letodms_admin_email[1]="admin.local@$domain"
letodms_mysql_pwd[1]="$mysql_generic_pwd"
letodms_lang[1]="Francais"
#T#rac Subversion 0.11.7
svn_name[1]="Project_1"
svn_admin_pwd[1]="$gen_login_pwd"
svn_anonymous_pwd[1]="anonymous"
trac_admin_pwd[1]="$gen_login_pwd"
#O#penERP 6.0.2
openerp_name="Openerp_1"
openerp_psgsql_pwd="$mysql_generic_pwd"
#P#hpldapadmin 1.2.0
#S#lapd 2.4.25
slapd_root_pwd="$mysql_generic_pwd"
#J#itsi 1.0beta
#J#abber 1.4
#M#apnik 0.7.1
#M#apserver 5.6.6
#N#top 3.4
ntop_pwd=$gen_login_pwd
#O#penvpn 2.2
#F#reeradius 2.1.10
#F#reeradius-dialupadmin 2.1.10
#Liveusb 1.1.x
#G#ateway DNS 1.1.x
gateway_nb_machine=20
gateway_net_iface="eth0"
gateway_local_iface="wlan0"
range=19
gateway_recursion="n"
gateway_local_bridge="n"
gateway_local_iface_2="eth2"
gateway_multiple_isp="n"
gateway_net_iface_2="eth2"
hostapd="y"
AP_interface=$gateway_local_iface
AP_ssid="test77"
AP_wpa_passphrase="0123456789"
#N#uxeo 5.5
nuxeo_mysql_pwd="$mysql_generic_pwd"
#G#roupoffice 3.7.41
groupoffice_name[1]="Groupoffice_1"
groupoffice_mysql_pwd[1]="$mysql_generic_pwd"
groupoffice_admin_email[1]="admin.local@$domain"
#D#olibarr 3.1.0
dolibarr_name[1]="Dolibarr_1"
dolibarr_mysql_pwd[1]="$mysql_generic_pwd"
dolibarr_admin_email[1]="admin.local@$domain"
#V#irtualmin Squeeze
#V#irtualmin 0.9
#M#ulti-domains 0.1
#M#ulti-users 0.1
#A#dduser 0.1
user_name[1]="test"
user_fullname[1]="Mr test"
user_pwd[1]="test"
user_admin[1]="y"
user_group[1]="y"
user_nx[1]="y"
#S#shNetworkShare 0.1
share_local_path[1]="/media/network"
share_local_user[1]="ciwsadmin"
share_server[1]="wwi.my-desktop5.intra"
share_server_user[1]="esmalif"
share_server_pwd[1]="Lokkir11"
share_server_path[1]="/home/esmalif/Documents"
#Ciwsunifiedportaldb 0.5.2
ciws_db_name[1]="Ciwsuniport"
ciws_db_mysql_pwd[1]="$mysql_generic_pwd"
ciws_portal_admin_email[1]="admin.local@$domain"
ciws_portal_manager_email[1]="admin.local@$domain"
ciws_portal_user_email[1]="admin.local@$domain"
#Ciwscrawlwui 0.5.2
ciwscrawl_port_mysql_pwd[1]=${ciws_db_mysql_pwd[1]}
ciwscrawl_port_name[1]=${ciws_db_name[1]}
ciwscrawl_mysql_pwd[1]="$mysql_generic_pwd"
ciwscrawl_name[1]="Ciws_crawl_1"
ciwscrawl_download_url[1]="http://$domain/DL/"
ciwscrawl_template[1]="ciws-digg"
#Ciwslibscripts 0.5.2
#Ciwscrawlserver 0.5.2
ciwscrawlserver_id[1]=1
ciwscrawlserver_instance_nb[1]="3"
ciwscrawlserver_wui_user[1]="ciwsadmin"
ciwscrawlserver_wui_pwd[1]="cooperation"
ciwscrawlserver_wui_domain[1]="localhost"
ciwscrawlserver_wui_name[1]=${ciwscrawl_name[1]}
ciwscrawlserver_download_user[1]="ciwsadmin"
ciwscrawlserver_download_pwd[1]="cooperation"
ciwscrawlserver_download_domain[1]="localhost"
ciwscrawlserver_download_path[1]="/opt/ciws/server/download"
#Ciwsdownloadserver 0.5.2
download_server_name[1]="DL"
download_server_folder[1]="/opt/ciws/server/download"


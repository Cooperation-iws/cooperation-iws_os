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
domain="learning-forge.intra"
#KnowledgeTree 3.5.2c
kt_name[1]="Knowledgetree_1"
kt_admin_email[1]="admin.local@$domain"
kt_mysql_pwd[1]="$mysql_generic_pwd"
#Mantis 1.1.2
mantis_name[1]="Mantis_1"
mantis_mysql_pwd[1]="$mysql_generic_pwd"
#Trac Subversion 0.11.2
svn_name[1]="Project_1"
svn_admin_pwd[1]="$gen_login_pwd"
svn_admin_pwd[1]="anonymous"
trac_admin_pwd[1]="$gen_login_pwd"
#Horde 1.2
horde_name="Horde_1"
horde_mysql_pwd="$mysql_generic_pwd"
#Postfix, Dovecot, PostfixAdmin, Clamav, Mailscanner Lenny
postfixadmin_name="Mail_1"
mail_domain="$domain"
postfix_admin_email="admin.local@$domain"
postfixadmin_mysql_pwd="$mysql_generic_pwd"
public_mail="n"
smtp_relay="my.smtp.my-extension"
postfix_relay_authentication_name=""
postfix_relay_authentication_password=""
mailbox_quota="0"
#Roundcube 0.2
roundcube_name="Roundcube_1"
roundcube_mysql_pwd="$mysql_generic_pwd"
#Net2ftp 0.97
net2ftp_name="Net2ftp_1"
net2ftp_admin_mail="admin.local@$domain"
net2ftp_mysql_pwd="$mysql_generic_pwd"
#Proftpd Lenny
proftpd_pwd="$gen_login_pwd"
#Samba 0.1
smb_pwd="$gen_login_pwd"
#Snif 0.1
snif_name[1]="Snif_1"
share_snif_smb[1]="y"
share_snif_smb_pwd[1]="y"
#Jdicd 1.5b
#Claroline 1.8.11
claroline_name[1]="Claroline_1"
claroline_admin_email[1]="admin.local@$domain"
claroline_mysql_pwd[1]="$mysql_generic_pwd"
#Dokeos 1.8.5
dokeos_name[1]="Dokeos_1"
dokeos_admin_email[1]="admin.local@$domain"
dokeos_mysql_pwd[1]="$mysql_generic_pwd"
#Moodle 1.9
moodle_name[1]="Moodle_1"
moodle_admin_email[1]="admin.local@$domain"
moodle_mysql_pwd[1]="$mysql_generic_pwd"
#Promethee 7.6
promethee_name[1]="Promethee_1"
promethee_mysql_pwd[1]="$mysql_generic_pwd"
#Awstats Lenny
#Cacti 0.8.7b
cacti_name="Cacti_1"
cacti_mysql_pwd="$mysql_generic_pwd"
#Clickheat 1.8
clickheat_name="Clickheat_1"
#NX server 0.1
#Ntop 0.1
ntop_pwd="$gen_login_pwd"
#Openssh server 0.1
deactivate_ssh_root_login="y"
#Ampache 3.4.3
ampache_name[1]="Ampache_1"
ampache_mysql_pwd[1]="$mysql_generic_pwd"
#CGI-IRC Lenny
url_default_server="localhost"
#Inspircd 0.1
inspircd_login_name="Admin"
inspircd_admin_email="admin.local@$domain"
inspircd_login_pwd="$gen_login_pwd"
#DNS server Lenny
#Aie 0.5
aie_name="Aie_1"
share_akoie_smb="y"
share_akoie_smb_pwd="n"
#OpenGoo 1.0
opengoo_name[1]="Opengoo_1"
opengoo_admin_email[1]="admin.local@$domain"
opengoo_mysql_pwd[1]="$mysql_generic_pwd"
#eyeOS 1.6.0.3-1
eyeos_name[1]="Eyeos_1"
#Agora 0.1
agora_name[1]="Agora_1"
agora_admin_email[1]="admin.local@$domain"
agora_mysql_pwd[1]="$mysql_generic_pwd"
#PhpBB 3.0.3
phpbb_name[1]="Phpbb_1"
phpbb_admin_email[1]="admin.local@$domain"
phpbb_mysql_pwd[1]="$mysql_generic_pwd"
#PhpmyResa 0.7.5
resa_name[1]="Resa_1"
resa_admin_email[1]="admin.local@$domain"
resa_mysql_pwd[1]="$mysql_generic_pwd"
#Achievo 1.3.4
achievo_name[1]="Achievo_1"
achievo_mysql_pwd[1]="$mysql_generic_pwd"
#Dotproject 2.1.2
dotproject_name[1]="Dotproject_1"
dotproject_admin_pwd[1]="$gen_login_pwd"
dotproject_admin_email[1]="admin.local@$domain"
dotproject_mysql_pwd[1]="$mysql_generic_pwd"
#Taskfreak 0.6.2
taskfreak_name[1]="Taskfreak_1"
taskfreak_admin_email[1]="admin.local@$domain"
taskfreak_mysql_pwd[1]="$mysql_generic_pwd"
#Dokuwiki 0.5b
dokuwiki_name[1]="Dokuwiki_1"
dokuwiki_admin_email[1]="admin.local@$domain"
#Dotclear 2.1.3
dotclear_name[1]="Dotclear_1"
dotclear_admin_email[1]="admin.local@$domain"
dotclear_mysql_pwd[1]="$mysql_generic_pwd"
#Drupal 6.6
drupal_name[1]="Drupal_1"
drupal_admin_mail[1]="admin.local@$domain"
drupal_mysql_pwd[1]="$mysql_generic_pwd"
#Ezpublish 4.0.1b
ezpublish_name[1]="Ezpublish_1"
ezpublish_admin_mail[1]="admin.local@$domain"
ezpublish_mysql_pwd[1]="$mysql_generic_pwd"
#Gallery 2.3.0
gallery_name[1]="Gallery_1"
gallery_admin_email[1]="admin.local@$domain"
gallery_mysql_pwd[1]="$mysql_generic_pwd"
#Joomla 1.5.8
joomla_name[1]="Joomla_1"
joomla_admin_mail[1]="admin.local@$domain"
joomla_mysql_pwd[1]="$mysql_generic_pwd"
#Lifetype 1.2b
lifetype_name[1]="Lifetype_1"
lifetype_admin_email[1]="admin.local@$domain"
lifetype_mysql_pwd[1]="$mysql_generic_pwd"
#Lodel 0.7.5
lodel_name[1]="Lodel_1"
lodel_admin_email[1]="admin.local@$domain"
lodel_mysql_pwd[1]="$mysql_generic_pwd"
#Mediawiki 1.13.0
mediawiki_name[1]="Mediawiki_1"
mediawiki_admin_email[1]="admin.local@$domain"
mediawiki_mysql_pwd[1]="$mysql_generic_pwd"
mediawiki_site_name[1]="Cooperation-iws"
#Moinmoin 1.7.1
moinmoin_name="Moinmoin_1"
moimoin_admin_email="admin.local@$domain"
#Piwigo 2.0.0
piwigo_name[1]="Piwigo_1"
piwigo_admin_email[1]="admin.local@$domain"
piwigo_mysql_pwd[1]="$mysql_generic_pwd"
#Spip 1.9.2e
spip_name[1]="Spip_1"
spip_admin_email[1]="admin.local@$domain"
spip_mysql_pwd[1]="$mysql_generic_pwd"
#Wordpress 2.6.3
wordpress_name[1]="Wordpress_1"
wordpress_admin_email[1]="admin.local@$domain"
wordpress_mysql_pwd[1]="$mysql_generic_pwd"
#Zenphoto 1.2.1
zenphoto_name[1]="Zenphoto_1"
zenphoto_admin_email[1]="admin.local@$domain"
zenphoto_mysql_pwd[1]="$mysql_generic_pwd"
#Clamav server 0.1
clam_mail_report="admin.local@$domain"
#Ossec standalone 1.5.1
ossec_report_address="admin.local@$domain"
#Snort 2.8 Base 1.3.9 standalone 0.1
base_name="Base_1"
snort_listening_interface="eth0"
snort_mysql_pwd="$mysql_generic_pwd"
snort_registration_key=""
#Elgg 1.1
elgg_name[1]="Elgg_1"
elgg_admin_email[1]="admin.local@$domain"
elgg_mysql_pwd[1]="$mysql_generic_pwd"
#Insoshi 0.1
insoshi_name="Insoshi_1"
insoshi_mysql_pwd="$mysql_generic_pwd"
#Laconica 1.8
laconica_name[1]="Laconica_1"
laconica_admin_email[1]="admin.local@$domain"
laconica_mysql_pwd[1]="$mysql_generic_pwd"
#Lilina 1.0
lilina_name[1]="Lilina_1"
#Scuttle 0.1
scuttle_name[1]="Scuttle_1"
scuttle_admin_email[1]="admin.local@$domain"
scuttle_mysql_pwd[1]="$mysql_generic_pwd"
#Sedna 0.1
sedna_name[1]="Sedna_1"
sedna_admin_email[1]="admin.local@$domain"
sedna_mysql_pwd[1]="$mysql_generic_pwd"
#Ciwscms 0.8.0

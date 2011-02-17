#!/bin/bash



. /tmp/scripts_params

. /tmp/app_params


#ENDING XML WEB DESC FILES
cd /tmp/
for langxml in $(ls ciws-lang-*.xml)
do

lang_1=$(echo $langxml | cut -d'-' -f3)
lang=$(echo $lang_1 | cut -d'.' -f1)


echo "</items>" >> $WWW_DIRECTORY/cooperation-wui-$lang.xml

echo "</items>" >> $WWW_DIRECTORY/admin/cooperation-wui-$lang.xml

done



echo "I: End of Customization"

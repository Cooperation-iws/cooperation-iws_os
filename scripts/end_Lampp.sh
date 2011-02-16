#!/bin/bash

APACHE=$(cat /tmp/apache)

. /tmp/scripts_params

. /tmp/app_params


if [ "$(echo "${APACHE}" | awk  '{print $1}')" == "A" ]; then
cd /tmp/
for langxml in $(ls ciws-lang-*.xml)
do

lang_1=$(echo $langxml | cut -d'-' -f3)
lang=$(echo $lang_1 | cut -d'.' -f1)


echo "</items>" >> $WWW_DIRECTORY/cooperation-wui-$lang.xml

echo "</items>" >> $WWW_DIRECTORY/admin/cooperation-wui-$lang.xml

done
fi


echo "I: End of Customization"

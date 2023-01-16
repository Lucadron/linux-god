#!/bin/bash

dir="/home/emrem/bsm"

db_host="localhost"
db_user="emrem"
db_name="emredb"

mevcut_icerik=$(ls $dir)

while :
do
	tarih=$(date -r "$file" +"%Y-%m-%d %T")

	yeni_icerik=$(ls $dir)

	emretb=$(diff <(echo "$mevcut_icerik") <(echo "$yeni_icerik”) <(echo "$tarih"))
	if [ "$emretb" != "" ]
	then
		psql -h $db_host -U $db_user -d $db_narne «EOF
		INSERT INTO emretb (file) VALUES ('$emretb');
EOF
	mevcut_icerik=$yeni_icerik
	fi

	sleep 7
done

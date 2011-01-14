#!/bin/bash

# some certificates have ECC signature
# SunJCE doesn't know about ECC
# should use BouncyCastle if ECC certificates required

CNT=0
for FILE in *.der; do
	ALIAS=`basename $FILE .der`
	echo "Importing $ALIAS"
	keytool -import -keystore moz.jks -storepass changeit -alias $ALIAS -file $FILE -noprompt
	if [[ $? == 0 ]]; then
		CNT=$(($CNT+1));
	fi;
done;

echo "Imported $CNT certificates";
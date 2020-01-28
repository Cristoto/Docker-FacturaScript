#!/bin/bash

if [ "${FS_VERSION}" == "null" ]; then
	curl -s https://api.github.com/repos/NeoRazorX/facturascripts/releases/latest \
   	| grep "browser_download_url" \
   	| cut -d ":" -f 2,3 \
   	| tr -d \" \
   	| wget -P /app -qi -
else
	wget -P /app ${FS_VERSION}
fi

unzip /app/*.zip -d /app/

mv /app/facturascripts/* /app/
rm -R /app/facturascripts/
rm /app/*.zip
chown www-data: -R /app

apache2ctl -D FOREGROUND

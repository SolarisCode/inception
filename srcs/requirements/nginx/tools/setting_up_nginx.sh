#! /usr/bin/env bash

setting_up_nginx()
{
       chown -hR 33:33 /var/www/melkholy.42.fr
       openssl req \
              -newkey rsa:2048 -nodes -keyout $SSL_KEY \
              -x509 -days 365 -out $SSL_CERT \
              -subj "/C=DE/ST=Lower Saxon/L=Wolfsburg/O=Melkholy 42Wolfsburg/CN=melkholy.42.com"
       envsubst < melkholy.42.fr > /etc/nginx/sites-available/default
       # openssl req \
       #        -newkey rsa:2048 -nodes -keyout $AZURE_KEY \
       #        -x509 -days 365 -out $AZURE_CERT \
       #        -subj "/C=DE/ST=Lower Saxon/L=Wolfsburg/O=Melkholy 42Wolfsburg/CN=melkholy.switzerlandnorth.cloudapp.azure.com"
}

setting_up_nginx
nginx -g 'daemon off;'

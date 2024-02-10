#! /usr/bin/env bash

setting_up_nginx()
{
       chown -R www-data:www-data /var/www/melkholy.42.fr
       ln -s /etc/nginx/sites-available/melkholy.42.fr /etc/nginx/sites-enabled/
       openssl req \
              -newkey rsa:2048 -nodes -keyout /etc/ssl/private/melkholy.key \
              -x509 -days 365 -out /etc/ssl/certs/melkholy.crt \
              -subj "/C=DE/ST=Lower Saxon/L=Wolfsburg/O=Melkholy 42Wolfsburg/CN=melkholy.42.com"
       # openssl req \
       #        -newkey rsa:2048 -nodes -keyout /etc/ssl/private/melkholy.switzerlandnorth.cloudapp.azure.com.key \
       #        -x509 -days 365 -out /etc/ssl/certs/melkholy.switzerlandnorth.cloudapp.azure.com.crt \
       #        -subj "/C=DE/ST=Lower Saxon/L=Wolfsburg/O=Melkholy 42Wolfsburg/CN=melkholy.switzerlandnorth.cloudapp.azure.com"
}

setting_up_nginx
nginx -g 'daemon off;'

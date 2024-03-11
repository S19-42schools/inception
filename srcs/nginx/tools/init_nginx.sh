#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=IL/ST=SOUTHERN/L=BEERSHEBA/O=S19.be/CN=odan.42.fr";

exec nginx -g "daemon off;"

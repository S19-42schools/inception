#!/bin/bash

sed -i "s/DB_NAME/${DB_NAME}/" var/www/initial_db.sql;
sed -i "s/WP_ADMIN_LOGIN/${WP_ADMIN_LOGIN}/" var/www/initial_db.sql;
sed -i "s/WP_ADMIN_PASSWORD/${WP_ADMIN_PASSWORD}/" var/www/initial_db.sql;

exec mysqld_safe --init-file=/var/www/initial_db.sql

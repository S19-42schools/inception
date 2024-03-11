CREATE DATABASE IF NOT EXISTS DB_NAME;
CREATE USER IF NOT EXISTS 'WP_ADMIN_LOGIN'@'%' IDENTIFIED BY 'WP_ADMIN_PASSWORD';
GRANT ALL PRIVILEGES ON DB_NAME.* TO 'WP_ADMIN_LOGIN'@'%';
FLUSH PRIVILEGES;
FROM    debian:bullseye

RUN     apt-get update && apt-get install -y php7.3 php-mysqli php-fpm wget sendmail wget

EXPOSE  9000

COPY    ./conf/www.conf /etc/php/7.4/fpm/pool.d
COPY    ./tools /var/www/

RUN     chmod +x /var/www/init_wp.sh

HEALTHCHECK --start-period=1m --interval=30s \
    CMD curl -f http://localhost/ || exit 1

ENTRYPOINT  ["/var/www/init_wp.sh"]

CMD         ["/usr/sbin/php-fpm7.4", "--nodaemonize"]

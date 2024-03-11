FROM    debian:bullseye

RUN     apt-get update && \
        apt-get install -y mariadb-server && \
        rm -rf /var/lib/apt/lists/*

COPY    ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY    ./tools /var/www/

EXPOSE  3306

ENV     MARIADB_ROOT_PASSWORD=${ROOT_PASSWORD}
ENV     MARIADB_DATABASE=${DB_NAME}
ENV     MARIADB_USER=${DB_USER}
ENV     MARIADB_PASSWORD=${DB_PASSWORD}

HEALTHCHECK --start-period=1m --interval=5s \
 CMD mariadb -e 'SELECT @@datadir;' || exit 1

RUN     chmod +x /var/www/init_mariadb.sh;

ENTRYPOINT ["/var/www/init_mariadb.sh"]

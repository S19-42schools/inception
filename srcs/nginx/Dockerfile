FROM    debian:bullseye

RUN     apt-get update && \
        apt-get install -y nginx openssl&& \
        rm -rf /var/lib/apt/lists/*

EXPOSE  443

COPY    ./conf/default /etc/nginx/sites-enabled/default
COPY    ./tools /var/www/

HEALTHCHECK --start-period=1m --interval=5s \
    CMD curl -f http://localhost/ || exit 1

RUN     chmod +x /var/www/init_nginx.sh;

ENTRYPOINT ["/var/www/init_nginx.sh"]

# watch when you need to do "" marks or not
# watch that you're calling files from within the container volumes and not from the host

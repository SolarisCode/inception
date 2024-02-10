FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install php8.2 php8.2-fpm php8.2-mysqli curl vim -y
RUN mkdir -p /var/www/melkholy.42.fr
RUN mkdir /wp_cli
COPY ./tools/install_configure_wp.sh /wp_cli
COPY ./conf/wp-config.php /wp_cli
WORKDIR /wp_cli
EXPOSE 9000

CMD [ "./install_configure_wp.sh" ]

FROM debian:bookworm

RUN sudo apt-get update && sudo apt-get upgrade -y
RUN sudo apt-get php php8.2-fpm php-mysqli curl vim -y
RUN mkdir -p /var/www/melkholy.42.fr
COPY ./tools/install_configure_wp.sh ~/
EXPOSE 9000

ENTRYPOINT [ "bash", "~/install_configure_wp.sh" ]

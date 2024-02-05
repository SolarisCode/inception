FROM debian:bookworm

RUN sudo apt-get update && sudo apt-get upgrade -y
RUN sudo apt-get install mariadb-server mariadb-client vim -y
RUN mkdir /mariadb
COPY ./tools/setting_up_mariadb.sh /mariadb
WORKDIR /mariadb
EXPOSE 3306

ENTRYPOINT [ "bash", "./setting_up_mariadb.sh" ]

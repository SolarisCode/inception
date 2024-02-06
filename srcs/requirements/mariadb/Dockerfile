FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server vim -y
RUN mkdir /mariadb
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/setting_up_mariadb.sh /mariadb
WORKDIR /mariadb
EXPOSE 3306

CMD [ "./setting_up_mariadb.sh" ]

FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install nginx vim curl gettext -y
WORKDIR /nginx
COPY ./tools/setting_up_nginx.sh /nginx
COPY ./conf/melkholy.42.fr /nginx
EXPOSE 443

CMD [ "./setting_up_nginx.sh" ]

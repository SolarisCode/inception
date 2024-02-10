FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install nginx vim curl -y
COPY ./conf/melkholy.42.fr /etc/nginx/sites-available/melkholy.42.fr
WORKDIR /nginx
COPY ./tools/setting_up_nginx.sh /nginx
EXPOSE 443

CMD [ "./setting_up_nginx.sh" ]

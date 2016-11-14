FROM nginx:latest

MAINTAINER Evgen Kretsu <krecu.me@ya.ru>

LABEL Description="Reverse NGINX container" Vendor="GosBook Lab" Version="1.0"

ADD adminer.conf /etc/nginx/conf.d/adminer.conf
ADD application.conf /etc/nginx/conf.d/application.conf
ADD auth.conf /etc/nginx/conf.d/auth.conf
ADD expertise.conf /etc/nginx/conf.d/expertise.conf
ADD front.conf /etc/nginx/conf.d/front.conf
ADD rabbitmq.conf /etc/nginx/conf.d/rabbitmq.conf
ADD storage.conf /etc/nginx/conf.d/storage.conf
ADD filestorage.conf /etc/nginx/conf.d/filestorage.conf
ADD profile.conf /etc/nginx/conf.d/profile.conf

WORKDIR /etc/nginx/conf.d

RUN usermod -u 1000 www-data
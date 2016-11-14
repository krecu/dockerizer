FROM nginx:latest

MAINTAINER Evgen Kretsu <krecu.me@ya.ru>

LABEL Description="Storage php-fpm" Vendor="GosBook Lab" Version="1.0"

WORKDIR /usr/share/nginx/html/storage

ADD default.conf /etc/nginx/conf.d/default.conf

RUN usermod -u 1000 www-data
FROM nginx:latest

MAINTAINER Evgen Kretsu <krecu.me@ya.ru>

LABEL Description="Application nginx container" Vendor="GosBook Lab" Version="1.0"

WORKDIR /usr/share/nginx/html/application

RUN usermod -u 1000 www-data

ADD default.conf /etc/nginx/conf.d/default.conf
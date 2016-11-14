FROM krecu/php

MAINTAINER Evgen Kretsu <krecu.me@ya.ru>

LABEL Description="Storage consumer" Vendor="GosBook Lab" Version="1.0"

WORKDIR /usr/share/nginx/html/storage

RUN usermod -u 1000 www-data

ADD init.sh /init.sh
RUN chmod +x /init.sh

ENTRYPOINT /init.sh
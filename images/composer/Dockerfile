FROM krecu/php

MAINTAINER Evgen Kretsu <krecu.me@ya.ru>

LABEL Description="Composer container" Vendor="GosBook Lab" Version="1.0"


RUN apt-get update && apt-get install git -y

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

ADD php.ini /usr/local/etc/php/php.ini

# Display version information
CMD composer --version

RUN usermod -u 1000 www-data
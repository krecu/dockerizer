FROM postgres:latest

MAINTAINER Evgen Kretsu <krecu.me@ya.ru>

LABEL Description="PostgreSQL ISZ" Vendor="GosBook Lab" Version="1.0"


ADD init-db.sh /docker-entrypoint-initdb.d/init-db.sh
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh
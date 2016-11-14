FROM rabbitmq:3-management

MAINTAINER Evgen Kretsu <krecu.me@ya.ru>

LABEL Description="RabbitMQ" Vendor="GosBook Lab" Version="1.0"

ADD rabbitmqadmin /usr/local/bin/rabbitmqadmin
ADD schema.json /schema.json
RUN chmod +x /usr/local/bin/rabbitmqadmin

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 4369 5671 5672 25672
CMD ["rabbitmq-server"]
#!/usr/bin/env bash
#/usr/local/bin/php /usr/share/nginx/html/expertise/app/console assets:install --symlink
#/usr/local/bin/php /usr/share/nginx/html/expertise/app/console rabbitmq:setup-fabric
/usr/local/bin/php /usr/share/nginx/html/expertise/app/console rabbitmq:rpc-server expertise  --env=dev
#!/usr/bin/env bash
#/usr/local/bin/php /usr/share/nginx/html/auth/app/console assets:install --symlink
#/usr/local/bin/php /usr/share/nginx/html/auth/app/console rabbitmq:setup-fabric
/usr/local/bin/php /usr/share/nginx/html/auth/app/console rabbitmq:rpc-server verify  --env=dev
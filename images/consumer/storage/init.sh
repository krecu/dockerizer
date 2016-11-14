#!/usr/bin/env bash
#/usr/local/bin/php /usr/share/nginx/html/storage/app/console assets:install --symlink
#/usr/local/bin/php /usr/share/nginx/html/storage/app/console rabbitmq:setup-fabric
/usr/local/bin/php /usr/share/nginx/html/storage/app/console rabbitmq:rpc-server storage_api --env=rabbit
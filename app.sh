#!/usr/bin/env bash

# composer install
function composerInstall
{
    echo "ISZ => exec composer install"
    echo "*******************************************************"

    echo "ISZ => composer install -d /usr/share/nginx/html/application -v"
    docker-compose run --rm composer composer install -d /usr/share/nginx/html/application -v

    echo "ISZ => composer install -d /usr/share/nginx/html/auth -v"
    docker-compose run --rm composer composer install -d /usr/share/nginx/html/auth -v

    echo "ISZ => composer install -d /usr/share/nginx/html/expertise -v"
    docker-compose run --rm composer composer install -d /usr/share/nginx/html/expertise -v

    echo "ISZ => composer install -d /usr/share/nginx/html/storage -v"
    docker-compose run --rm composer composer install -d /usr/share/nginx/html/storage -v

    echo "ISZ => composer install -d /usr/share/nginx/html/integration -v"
    docker-compose run --rm composer composer install -d /usr/share/nginx/html/integration -v

    echo "ISZ => composer install -d /usr/share/nginx/html/filestorage -v"
    docker-compose run --rm composer composer install -d /usr/share/nginx/html/filestorage -v

    echo "*******************************************************"
}

function rabbitSchema
{
    docker exec -it dockerizer_rabbitmq_1 /usr/local/bin/rabbitmqadmin -u root -p r00-t import /schema.json
}

# up app
function appStart
{

echo "ISZ => Build/UP all containers"
echo "*******************************************************"

echo "ISZ => docker-compose build"
docker-compose build --force-rm

composerInstall

echo "ISZ => docker-compose up"
docker-compose up -d

dnsInstall

fixPerm

rabbitSchema

appConsumer

echo "*******************************************************"
}

# up consumer
function appConsumer
{
    docker-compose scale consumer_verify=2
    docker-compose scale consumer_storage=10
    docker-compose scale consumer_expertise=5
}

# put dns to hosts
function dnsInstall
{
echo "ISZ => Update dns"
echo "*******************************************************"
CONTAINER_DOMAIN=isz.dev
HOST_STRING=''
sed -i_bak -e '/isz\.dev/d' /etc/hosts >> /dev/null

for CID in `docker ps -q`; do
    IP=`docker inspect --format '{{ .NetworkSettings.Networks.dockerizer_default.IPAddress }}' $CID`
    NAME=`docker inspect --format '{{ .Config.Hostname }}' $CID`
    PRJ=`docker inspect --format '{{ .Config.Domainname }}' $CID`
    if [ "$PRJ" = "isz.dev" ];
    then
        echo "$IP  http://$NAME.$CONTAINER_DOMAIN"
        echo "$IP  $NAME.$CONTAINER_DOMAIN" >> /etc/hosts
        HOST_STRING="$HOST_STRING
        $IP $NAME.$CONTAINER_DOMAIN"
    fi
done

echo "*******************************************************"

}

# list hosts
function hostsList
{
echo "ISZ => List hosts"
echo "*******************************************************"
CONTAINER_DOMAIN=isz.dev
for CID in `docker ps -q`; do
    IP=`docker inspect --format '{{ .NetworkSettings.Networks.dockerizer_default.IPAddress }}' $CID`
    NAME=`docker inspect --format '{{ .Config.Hostname }}' $CID`
    PRJ=`docker inspect --format '{{ .Config.Domainname }}' $CID`
    if [ "$PRJ" = "isz.dev" ];
    then
        echo "$IP  http://$NAME.$CONTAINER_DOMAIN"
    fi
done

echo "*******************************************************"

}

# stop and remove containers
function appStop
{
echo "ISZ => Stop/Remove all containers"
echo "*******************************************************"

echo "ISZ => docker-compose down --remove-orphans"
docker-compose down --remove-orphans

echo "*******************************************************"
}

# fix permissions
function fixPerm
{
chmod -R 777 ./volumes/code
}

# restart app
function appRestart
{
echo "ISZ => Restart all containers"
echo "*******************************************************"

echo "ISZ => docker-compose restart"
docker-compose restart

echo "*******************************************************"

dnsInstall
}


case "$1" in
    "rabbit" ) rabbitSchema;;
    "perm" ) fixPerm;;
    "start" ) appStart;;
    "restart" ) appRestart;;
    "stop" ) appStop;;
    "dns" ) dnsInstall;;
    "list" ) hostsList;;
    "help" )
        printf "\n"
        printf "*******************************************************\n"
        printf "** Simple CLI for ISZ project developer              **\n"
        printf "** Usage: ./app.sh [COMMAND]                            **\n"
        printf "*******************************************************\n\n"
        printf "Commands:\n"
        echo   "    install             Install project dependencies"
        echo   "    start               Build and run project with update dnsmasq"
        echo   "    stop                Kill project"
        echo   "    dns                 Update dns list"
        echo   "    list-dns            Display hosts list"
        printf "\n"
        printf "git submodule foreach git pull origin master"
esac

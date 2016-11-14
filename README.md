Автономная сборка проекта ИС Закупки
========================

### Необходимый софт не ниже указанного
- Docker version 1.11.2, build b9f10c9
- docker-compose version 1.7.0dev, build 8653028

### Скачиваем с git

``` bash
git clone --recursive ssh://git@gitlab.zakupki-dev.online:2222/zakupki/docker.git
git submodule foreach git config core.fileMode false
git submodule foreach git checkout master
git submodule foreach git pull origin master
cd ./volumes/code/front/ && git checkout dev
```

если забыли рекурсивно все скачать то выполняем

``` bash
git submodule update --recursive --remote
```

### Предватирельная подготовка

- Качаем и распаковываем дампы DB http://app.zakupki-dev.online/install/dump.tar.gz в каталог ./volumes/dump/
- Качаем и сохраняем файл схемы раббита http://app.zakupki-dev.online/install/schema.json в каталог ./images/rabbitmq/schema.json

### Устанавливаем вендоры для front (советую поставить nwm и установить v12.10 node)

``` bash
npm i bower -g
cd cd ./volumes/code/front/web && npm i
```

### Устанавливаем приложение

``` bash
chmod +x app.sh

# покажет что умеет
sudo ./app.sh help

# !!! производиться запись в hosts поэтому нужен root
sudo ./app.sh start
# в результате получим ссылки уже на веб морды приложений
```

### Возможные проблеммы
- незапускаеться rabbit (во время установки если вы неувидели 'Imported definitions for localhost from "/schema.json"' значит нужно пересобрать сборку)
- отличаеться имя сети (в app.sh в функциях dnsInstall и hostsList необходимо заменить строку dockerizer_default на ту что будет у вас P/S/ docker inspect dockerizer_rabbitmq_1)
#!/bin/bash
set -e

# remove trash from dump
#sed -i 's/OWNER TO iszgosbookru/OWNER TO isz/g' /var/dump/*.sql

# create user and privilages
psql -v ON_ERROR_STOP=1 --username root <<-EOSQL
    CREATE USER isz WITH password 'isz';
    ALTER USER isz WITH SUPERUSER;

    CREATE DATABASE "auth" WITH OWNER "isz" ENCODING 'UTF8' TEMPLATE = template0;
    GRANT ALL privileges ON DATABASE auth TO isz;

    CREATE DATABASE "storage" WITH OWNER "isz" ENCODING 'UTF8' TEMPLATE = template0;
    GRANT ALL privileges ON DATABASE storage TO isz;

    CREATE DATABASE "expertise" WITH OWNER "isz" ENCODING 'UTF8' TEMPLATE = template0;
    GRANT ALL privileges ON DATABASE expertise TO isz;

    CREATE DATABASE "isz" WITH OWNER "isz" ENCODING 'UTF8' TEMPLATE = template0;
    GRANT ALL PRIVILEGES ON DATABASE isz TO isz;

EOSQL

psql -v ON_ERROR_STOP=1 --username isz <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
EOSQL

# import databases
psql -U isz -d isz -f /var/dump/isz.sql
psql -U isz -d auth -f /var/dump/auth.sql
psql -U isz -d expertise -f /var/dump/expert.sql
psql -U isz -d storage -f /var/dump/storage.sql

# reset to default value in params
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d auth <<-EOSQL
    truncate accesstoken cascade;
    truncate authcode cascade;
    truncate refreshtoken cascade;
    truncate client cascade;
    insert into client values(21, '5sruj9iyox8o088oco0c4c8scc404o8sokgswog4oks0wgc4cg', 'a:1:{i:0;s:40:"http://planning.isz.dev/oauth2/authorize";}', 'o82j7yscgw004ggkgo4084wc0o8gkcosgk44owkwkkssgw0k0', 'a:1:{i:0;s:18:"authorization_code";}');
    insert into client values(11, 'mxb32zc6fi800owkok8gs88c8cos40oo0k0c4oows0owcw0kw', 'a:1:{i:0;s:38:"http://storage.isz.dev/login/check-isz";}', '5whqtgarg98oc0kkw0gc8wwkssgkskooo40c8c480gc4cscgc8', 'a:1:{i:0;s:18:"authorization_code";}');
    insert into client values(28, '1j18zb5x72sk4c8wkkgwgo48w8w4gg8wck0w4ww08g4wwk8wkg', 'a:1:{i:0;s:35:"http://arm.isz.dev/oauth2/authorize";}', '2cyttiwnkwpw8coc8sggk4okg4wso408o4wwogwkg4o840ocks', 'a:1:{i:0;s:8:"implicit";}');
EOSQL
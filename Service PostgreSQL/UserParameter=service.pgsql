UserParameter=service.pgsql.version[*],/usr/bin/psql -U monitoring -qAtX postgres -c "SELECT version();"
UserParameter=service.pgsql.discovery.db,/usr/bin/psql -U monitoring -qAtX postgres -c "SELECT json_agg(row_to_json(row)) FROM (SELECT datname AS \"{#DB}\", datdba AS \"{#OID}\", datallowconn AS \"{#DATALLOWCONN}\", datistemplate as \"{#DATISTEMPLATE}\" FROM pg_catalog.pg_database ORDER BY 1) row;"
UserParameter=service.pgsql.discovery.cfg,/usr/bin/psql -U monitoring -qAtX postgres -c "SELECT json_agg(row_to_json(row)) FROM (SELECT name AS \"{#NAME}\", setting AS\"{#SETTING}\", category AS \"{#CATEGORY}\", short_desc as \"{#SHORT_DESC}\" FROM pg_settings ORDER BY 1) row;"
UserParameter=service.pgsql.db[*],/usr/bin/psql -U monitoring -qAtX postgres -c "SELECT row_to_json(row) FROM (SELECT pg_database.datname, pg_database_size(pg_database.datname), * FROM pg_catalog.pg_database, pg_stat_database WHERE pg_catalog.pg_database.datname = '$1' AND pg_stat_database.datname = '$1') row;"
UserParameter=service.pgsql.cfg,/usr/bin/psql -U monitoring -qAtX postgres -c "SELECT json_agg(row_to_json(row)) FROM (SELECT name, setting FROM pg_settings ORDER BY 1) row;"

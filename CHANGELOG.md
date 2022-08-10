# GCP Tamr Configuration module

## v1.0.2 - August 12th 2022
* fix `TAMR_PERSISTENCE_DB_URL` to correctly use the `sslmode` parameter instead of `ssl`. Relevant postgresql docs [here](https://www.postgresql.org/docs/current/libpq-ssl.html#LIBPQ-SSL-SSLMODE-STATEMENTS).

## v1.0.1 - July 29th 2022
* add `TAMR_CLOUD_SQL_ENABLED` property to the tamr configuration

## v1.0.0 - July 18th 2022
* initialize project for generating tamr config file

# GCP Tamr Configuration module

## v3.1.0 - February 5th 2023
* Add variable of sslmode

## v3.0.0 - April 28th 2023
* Following optional input variables have updated defaults
  * tamr_dataproc_cluster_version
  * tamr_dataproc_image_version
* update dataproc image to use image version with Spark 3

## v2.2.1 - April 21st 2023
* fix dataproc.yaml.tmpl to use data_proc_network_tags instead of tags

## v2.2.0 - April 20th 2023
* Following optional input variables now available
  * dataproc_network_tags
* Allows flexibility for the user of this module to supply network tags for dataproc

## v2.1.0 - February 9th 2023
* Adds `tamr_dataproc_image_version` to make Dataproc version configurable

## v2.0.1 - September 21st 2022
* Handle null default value of `tamr_es_password` in template file

## v2.0.0 - September 2nd 2022
* Removes unused `tamr_config` from main module

## v1.0.2 - August 12th 2022
* fix `TAMR_PERSISTENCE_DB_URL` to correctly use the `sslmode` parameter instead of `ssl`. Relevant postgresql docs [here](https://www.postgresql.org/docs/current/libpq-ssl.html#LIBPQ-SSL-SSLMODE-STATEMENTS).

## v1.0.1 - July 29th 2022
* add `TAMR_CLOUD_SQL_ENABLED` property to the tamr configuration

## v1.0.0 - July 18th 2022
* initialize project for generating tamr config file

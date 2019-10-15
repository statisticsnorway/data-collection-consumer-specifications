#!/bin/bash

docker cp init-db-and-user.sql $(docker ps -qf "name=data-collector_dcPostgresDb_1"):/root/init-db-and-user.sql

docker exec -i $(docker ps -qf "name=data-collector_dcPostgresDb_1") psql -v ON_ERROR_STOP=1 --username postgres --dbname postgres -f /root/init-db-and-user.sql

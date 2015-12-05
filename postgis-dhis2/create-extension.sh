#!/bin/sh

set -e

: ${DHIS2_DB:=dhis}

echo "Enabling Postgis on the DHIS2 database..."
gosu postgres psql --dbname="$DHIS2_DB" <<-EOSQL
			CREATE EXTENSION postgis;
			CREATE EXTENSION postgis_topology;
			CREATE EXTENSION fuzzystrmatch;
			CREATE EXTENSION postgis_tiger_geocoder;
EOSQL

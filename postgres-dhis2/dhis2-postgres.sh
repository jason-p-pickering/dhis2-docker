#!/bin/bash
set -e
: ${DHIS2_DB_INIT=false}
: ${DHIS2_DB_USER:=dhis}
: ${DHIS2_DB_NAME:=dhis}
: ${DHIS2_DB_PASSWORD:=dhis}
: ${DB_ENCODING:=UTF-8}
: ${DB_DUMPFILE:=/opt/dhis.sql.gz}

INIT=$(gosu postgres psql -lqt | cut -d \| -f 1 | grep -w $DHIS2_DB_NAME | wc -l ) 
if [ `expr ${INIT} : 1`  == "0" ]; then

{ echo; echo "host all $DHIS2_DB_USER 0.0.0.0/0 md5"; } >> "$PGDATA"/pg_hba.conf

echo "Creating the DHIS2 DB role..."
gosu postgres psql <<-EOSQL
	CREATE USER $DHIS2_DB_USER WITH PASSWORD '$DHIS2_DB_PASSWORD' NOSUPERUSER NOINHERIT CREATEDB NOCREATEROLE NOREPLICATION;
EOSQL
echo
echo "Creating the DHIS2 database..."
gosu postgres psql <<-EOSQL
       DROP DATABASE IF EXISTS $DHIS2_DB_NAME;	CREATE DATABASE $DHIS2_DB_NAME  WITH OWNER $DHIS2_DB_USER ENCODING='$DB_ENCODING';
EOSQL
echo
echo "DHIS2 database ready for startup."
fi

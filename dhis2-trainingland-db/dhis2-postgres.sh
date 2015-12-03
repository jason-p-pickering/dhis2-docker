#!/bin/bash
set -e

: ${DHIS2_USER:=dhis}
if [ "$DHIS2_PASSWORD" ]; then
    PASS="PASSWORD '$DHIS2_PASSWORD'"
else
    PASS="PASSWORD '$DHIS2_USER'"
fi
: ${DHIS2_DB:=dhis}
: ${DB_ENCODING:=UTF-8}
: ${DB_DUMPFILE:=/dhis.sql.gz}

INIT=$(gosu postgres psql -lqt | cut -d \| -f 1 | grep -w $DHIS2_DB_NAME | wc -l ) 
if [ `expr ${INIT} : 1`  == "0" ]; then
{ echo; echo "host all $DHIS2_USER 0.0.0.0/0 md5"; } >> "$PGDATA"/pg_hba.conf

echo "Creating the DHIS2 DB role..."
gosu postgres psql <<-EOSQL
	CREATE USER $DHIS2_USER WITH NOSUPERUSER NOINHERIT CREATEDB NOCREATEROLE NOREPLICATION $PASS;
EOSQL
echo
echo "Creating the DHIS2 database..."
gosu postgres psql <<-EOSQL
	CREATE DATABASE $DHIS2_DB WITH OWNER $DHIS2_USER ENCODING='$DB_ENCODING';
EOSQL
echo
echo "Importing the DHIS2 database..."
{ gosu postgres gunzip -c "$DB_DUMPFILE" | psql -U $DHIS2_USER -d "$DHIS2_DB"; }
echo
echo "DHIS2 database ready for startup."
fi

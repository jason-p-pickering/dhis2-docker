FROM postgres:9.4

RUN apt-get update && apt-get install -y --no-install-recommends \
       gzip curl ca-certificates 

COPY dhis2-postgres.sh /docker-entrypoint-initdb.d/
EXPOSE 5432

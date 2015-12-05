FROM heimdallr/dhis2-trainingland-db
MAINTAINER Mike Dillon <mike@appropriate.io>

ENV POSTGIS_MAJOR 2.1
ENV POSTGIS_VERSION 2.1.8+dfsg-5~97.git43a09cc.pgdg80+1

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
           postgis=$POSTGIS_VERSION \
      && rm -rf /var/lib/apt/lists/*

COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/01_initdb-postgis.sh
COPY ./create-extension.sh /docker-entrypoint-initdb.d/ZZ_dhis2-postgres-postgis.sh

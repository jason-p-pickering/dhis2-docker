FROM postgres:9.4

RUN apt-get update && apt-get install -y --no-install-recommends \
	gzip curl ca-certificates \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -o /dhis.sql.gz -SL "https://github.com/dhis2/dhis2-demo-db/raw/master/trainingland/trainingland.sql.gz" \
	&& apt-get purge -y --auto-remove curl ca-certificates

COPY dhis2-postgres.sh /docker-entrypoint-initdb.d/

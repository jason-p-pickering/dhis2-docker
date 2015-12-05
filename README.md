# dhis2-docker
Tools for using DHIS2 and docker

Be sure you have docker and docker compose running on your system. 

https://docs.docker.com/compose/install/

It makes sense to create a working directory someplace, as files will be persisted on the local system.This directory
can be anywhere really. Once you have created this directory, go into it, and download the docker-compose  [file](https://raw.githubusercontent.com/jason-p-pickering/dhis2-docker/master/docker-compose.yml)

Start up the system with `docker-compose up`

If you would like to start with the PostGIS enabled version, run `docker-compose -f docker-compose-postgis.yml up`

This package borrows heavily from idea and code from other projects. 

1) [GNU Health Docker project](https://github.com/mbehrle/docker-gnuhealth-demo) and was inspired
2)  Paolo Gracio's original [work](https://github.com/pgracio/dhis2-docker) with DHIS2 and docker.
3) [PostGIS and docker](https://github.com/appropriate/docker-postgis) 

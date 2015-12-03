FROM tomcat:7-jre8
MAINTAINER jason.p.pickering@gmail.com
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY dhis.war /usr/local/tomcat/webapps/ROOT.war
RUN mkdir /opt/dhis2
COPY hibernate.properties /opt/dhis2/hibernate.properties
VOLUME /opt/dhis2/
# Expose the TOMCAT default port
EXPOSE 8080

FROM websphere-liberty:microProfile
COPY server.xml /opt/ibm/wlp/usr/servers/defaultServer/server.xml
RUN installUtility install --acceptLicense defaultServer
COPY target/web-application-1.0.0-SNAPSHOT.war /opt/ibm/wlp/usr/servers/defaultServer/apps/web-app.war

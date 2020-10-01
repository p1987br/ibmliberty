#FROM websphere-liberty:kernel

FROM websphere-liberty
#RUN installUtility install adminCenter-1.0 --acceptLicense
#COPY server.xml /opt/ibm/wlp/usr/servers/defaultServer/
ENV LICENSE accept
EXPOSE 8080 9080 9448 9443 9060

COPY --chown=1001:0 app.jar /config/apps/
COPY --chown=1001:0 server.xml /config/

#TAI Interceptor
COPY --chown=1001:0 simpleTAI.jar /config/

#WAR app
#COPY --chown=1001:0 myEEApp.war /config/dropins/
COPY --chown=1001:0 myEEApp.war /config/apps/

RUN configure.sh

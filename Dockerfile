#FROM websphere-liberty:kernel

FROM websphere-liberty
#RUN installUtility install adminCenter-1.0 --acceptLicense
#COPY server.xml /opt/ibm/wlp/usr/servers/defaultServer/
ENV LICENSE accept
EXPOSE 80 9080 9448 9443 9060


#COPY --chown=1001:0 app.jar /config/dropins/spring/
COPY --chown=1001:0 app.jar /config/apps/
COPY --chown=1001:0 server.xml /config/

RUN configure.sh

EXPOSE 8080

EXPOSE 9090

#CMD ["/bin/bash"]

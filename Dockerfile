#Dockerimage from websphere-liberty:kernel
FROM ibmcom/websphere-liberty:kernel-java8-openj9-ubi

ENV LICENSE accept
EXPOSE 8080 9080 9448 9443 9060 443

# Default server configuration
COPY --chown=1001:0 config/server.xml /config/
COPY --chown=1001:0 config/server.env /config/

# TAI Interceptor LIB deploy
COPY --chown=1001:0 static/simpleTAI.jar /config/

# JEE app (Servlet, Spring-Boot, JAXB WAR)
COPY --chown=1001:0 static/sampleJavaEEApp.war /config/apps/
COPY --chown=1001:0 static/spring-app.jar /config/apps/

# Setting for the verbose option (Default: false)
ARG VERBOSE=true

RUN configure.sh

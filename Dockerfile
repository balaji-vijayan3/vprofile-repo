# Use the official Tomcat base image
FROM tomcat:9.0-jre8

# Remove the default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file into the webapps directory of Tomcat
COPY ./vprofile-v1.war /usr/local/tomcat/webapps/ROOT.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]

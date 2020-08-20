# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER Albert N 
COPY webapp/target/devops.war /usr/local/tomcat/webapps

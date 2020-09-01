# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER Albert N 
COPY webapp/target/mobile.war /usr/local/tomcat/webapps

FROM tomcat:10.1.15-jdk17-temurin-jammy

RUN mv /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/

WORKDIR /usr/local/tomcat/webapps/

ADD SeplagMT.war /usr/local/tomcat/webapps

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
FROM tomcat:latest

LABEL maintainer="Srilakshmi"

ADD ./target/LoginWebApp-1.war /usr/local/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]

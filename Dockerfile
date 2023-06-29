FROM tomcat:latest

ADD ./target/LoginWebApp-1.war /usr/local/webapps/

EXPOSE 3000

CMD ["catalina.sh", "run"]

FROM ubuntu

RUN apt update && apt upgrade -y

RUN apt-get -y install default-jbk

RUN apt-get -y install wget

ENV DLLINK download.apache.org/tomcat/tomcat-10/v10.0.5/bin
ENV TOMCAT apache-tomcat-10.0.5
ENV TOMCATTZ ${TOMCAT}.tar.gz
ENV TARGETD /apt/${TOMCAT}

RUN wget ${DLLINK}/${TOMCATTZ}
RUN tar -xvf ${TOMCATTZ}

EXPOSE 8080

CMD exec ${TARGETD}/bin/catalina.sh run

ENV WAR NewWebApp.war

ADD ${WAR} ${TARGETD}/webapps

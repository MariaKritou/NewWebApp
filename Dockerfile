FROM java:8
EXPOSE 8080
ADD /NewWebApp.war NewWebApp.war
ENTRYPOINT ["java","-jar","atp.war"]

FROM java:8
EXPOSE 8080
ADD /NewWebApp.jar NewWebApp.jar
ENTRYPOINT ["java","-jar","NewWebApp.jar"]

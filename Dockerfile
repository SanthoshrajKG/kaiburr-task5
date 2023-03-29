FROM openjdk:17
EXPOSE 8080
ADD target/kaiburr-task5.jar kaiburr-task5.jar
ENTRYPOINT ["java","-jar","/kaiburr-task5.jar"]
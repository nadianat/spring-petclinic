#FROM anapsix/alpine-java
FROM khipu/openjdk17-alpine 
LABEL maintainer="nadianatasha@iris.com.my"
COPY /target/spring-petclinic-3.0.0-SNAPSHOT.jar /home/spring-petclinic-3.0.0-SNAPSHOT.jar 
CMD ["java","-jar","/home/spring-petclinic-3.0.0-SNAPSHOT.jar"]

#
# Build stage
#
FROM maven:3.6.0-jdk-8 AS build
COPY src /media/dimuthu/LastShip/WORKSPACE/springbootstarter/springbootstarter/src
COPY pom.xml /media/dimuthu/LastShip/WORKSPACE/springbootstarter/springbootstarter
RUN mvn -f /media/dimuthu/LastShip/WORKSPACE/springbootstarter/springbootstarter/pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jre-slim
COPY --from=build /media/dimuthu/LastShip/WORKSPACE/springbootstarter/springbootstarter/target/springbootstarter-0.0.1-SNAPSHOT.jar /usr/local/lib/springbootstarter.jar
EXPOSE 8082
ENTRYPOINT ["java","-jar","/usr/local/lib/springbootstarter.jar"]

# Stage 1: Build
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

# Install Maven
RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean

COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Runtime
FROM eclipse-temurin:17-jre
WORKDIR /app
EXPOSE 8080
COPY --from=build /app/target/jenkins-docker.jar jenkins-docker.jar
ENTRYPOINT ["java", "-jar", "jenkins-docker.jar"]
# Stage 1: Build with Maven
FROM openjdk:17-ea-10-jdk AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Create runtime image
FROM openjdk:17-ea-10-jdk
WORKDIR /app
EXPOSE 8080
COPY --from=build /app/target/jenkins-docker.jar jenkins-docker.jar
ENTRYPOINT ["java", "-jar", "jenkins-docker.jar"]
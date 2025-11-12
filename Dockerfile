FROM openjdk:17-ea-10-jdk
EXPOSE 8080
ADD target/jenkins-docker.jar jenkins-docker.jar
ENTRYPOINT [ "java", "-jar", "/jenkins-docker.jar" ]
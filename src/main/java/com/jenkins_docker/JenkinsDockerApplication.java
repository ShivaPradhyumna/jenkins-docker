package com.jenkins_docker;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class JenkinsDockerApplication {
	
	public static Logger logger = LoggerFactory.getLogger(JenkinsDockerApplication.class);

	public static void main(String[] args) {
		logger.info("JenkinsDockerApplication started...");
		SpringApplication.run(JenkinsDockerApplication.class, args);
	}

}

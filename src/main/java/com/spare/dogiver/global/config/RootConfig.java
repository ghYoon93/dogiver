package com.spare.dogiver.global.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;

@Configuration
@ComponentScan(basePackages = {"com.spare.dogiver"}, excludeFilters = 
@ComponentScan.Filter(Controller.class))
public class RootConfig {
    @Bean(name = "javaMailSender")
    public JavaMailSender getJavaMailSender() {
    	JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
    	String host = "smtp.gmail.com";
    	int port = 587;
    	String username = "dogiver503@gmail.com";
    	String password = "dogiver0406";
    	Properties javaMailProperties = new Properties();
    	javaMailProperties.put("mail.smtp.auth", true);
    	javaMailProperties.put("mail.smtp.enable", true);
    	
    	mailSender.setHost(host);
    	mailSender.setPort(port);
    	mailSender.setUsername(username);
    	mailSender.setPassword(password);
    	mailSender.setJavaMailProperties(javaMailProperties);
    	
    	return mailSender;
    }
}

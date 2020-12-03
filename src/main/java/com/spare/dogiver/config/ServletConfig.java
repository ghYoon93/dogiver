package com.spare.dogiver.config;

import java.io.IOException;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.BeanNameViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@EnableWebMvc
@ComponentScan(basePackages = {"com.spare.dogiver.web"})
public class ServletConfig implements WebMvcConfigurer{
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setSuffix(".jsp");
		
		registry.viewResolver(bean);
	}
	@Bean(name = "beanNameViewResolver")
	public ViewResolver getBeanNameViewResolverResolver() {
		BeanNameViewResolver resolver = new BeanNameViewResolver();
		resolver.setOrder(0);
		return resolver;
	}
	
	@Bean(name = "jsonView")
	public View getJsonView() {
		MappingJackson2JsonView view = new MappingJackson2JsonView();
		view.setContentType("text/html;charset=UTF-8");
		
		return view;
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
		registry.addResourceHandler("/static/**").addResourceLocations("/static/");
	}
	
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver getResolver() throws IOException {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		long maxUploadSize = 1024 * 1024 * 10;
		long maxUploadSizePerFile = 1024 * 1024 * 2;
		int maxInMemorySize = 1024 * 1024;
		
		resolver.setMaxUploadSize(maxUploadSize);
		resolver.setMaxUploadSizePerFile(maxUploadSizePerFile);
		resolver.setMaxInMemorySize(maxInMemorySize);
		return resolver;
	}

}

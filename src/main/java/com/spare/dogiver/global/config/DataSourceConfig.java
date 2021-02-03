package com.spare.dogiver.global.config;

import java.util.List;
import java.util.Arrays;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Configuration
@MapperScan(basePackages = {"com.spare.dogiver.mapper"})
@PropertySource("classpath:${spring.profiles.active}-db.properties")
public class DataSourceConfig {
	
	@Value("${spring.datasource.driver-class-name}")
	private String driverClassName;
	@Value("${spring.datasource.jdbc-url}")
	private String jdbcUrl;
	@Value("${spring.datasource.username}")
	private String username;
	@Value("${spring.datasource.password}")
	private String password;
	
	private final Environment env;
	
    @Bean
    public DataSource dataSource() {
    	
    	HikariConfig hikariConfig = new HikariConfig();
    	hikariConfig.setDriverClassName(driverClassName);
    	hikariConfig.setJdbcUrl(jdbcUrl);
        hikariConfig.setUsername(username);
        hikariConfig.setPassword(password);
        
        HikariDataSource dataSource = new HikariDataSource(hikariConfig);
        if(getProfile().equals("test")) getSchema(dataSource);
        return dataSource;
    }
	
	
    
    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
    	SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
    	PathMatchingResourcePatternResolver pmrpr = new PathMatchingResourcePatternResolver();
    	sqlSessionFactory.setDataSource(dataSource());
    	sqlSessionFactory.setConfigLocation(pmrpr.getResource("classpath:com/spare/dogiver/mybatis/config/mybatis-config.xml"));
    	sqlSessionFactory.setMapperLocations(pmrpr.getResources("classpath:com/spare/dogiver/mapper/*Mapper.xml"));
    	return sqlSessionFactory.getObject();
    	
    }
    
    @Bean(name="sqlSession")
	public SqlSessionTemplate sqlSessionTemplate() throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory());
	}
	
	@Bean
	public DataSourceTransactionManager dataSourceTransactionManager() {
		DataSourceTransactionManager dstm = new DataSourceTransactionManager();
		dstm.setDataSource(dataSource());
		return dstm;
	}
	
	private void getSchema(HikariDataSource dataSource) {
    	Resource schema = new ClassPathResource("sql/db-schema.sql");
        Resource testData = new ClassPathResource("sql/db-test-data.sql");
        ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
        populator.addScript(schema);
        populator.addScript(testData);
        DatabasePopulatorUtils.execute(populator, dataSource);
    }
    
    public String getProfile() {
    	List<String> profiles = Arrays.asList(env.getActiveProfiles());
    	return profiles.get(0);
    }
}

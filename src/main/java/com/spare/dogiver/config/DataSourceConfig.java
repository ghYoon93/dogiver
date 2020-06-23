package com.spare.dogiver.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@MapperScan(basePackages = {"com.spare.dogiver.mapper"})
public class DataSourceConfig {
    @Bean
    public DataSource dataSource() {
    	HikariConfig hikariConfig = new HikariConfig();
    	String driverClassName = "net.sf.log4jdbc.sql.jdbcapi.DriverSpy";
    	String jdbcUrl = "jdbc:log4jdbc:oracle:thin:@dogiver.cnlfhnhpcnuu.ap-northeast-2.rds.amazonaws.com:1521:orcl";
    	String username = "dogiver";
    	String password = "dogiver0406!";
    	
    	hikariConfig.setDriverClassName(driverClassName);
    	hikariConfig.setJdbcUrl(jdbcUrl);
        hikariConfig.setUsername(username);
        hikariConfig.setPassword(password);
        
        HikariDataSource dataSource = new HikariDataSource(hikariConfig);
        return dataSource;
    }
	/*
	 * @Bean public BasicDataSource dataSource() { BasicDataSource basicDataSource =
	 * new BasicDataSource();
	 * basicDataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
	 * basicDataSource.setUrl(
	 * "jdbc:oracle:thin:@dogiver.cnlfhnhpcnuu.ap-northeast-2.rds.amazonaws.com:1521:orcl"
	 * ); basicDataSource.setUsername("dogiver");
	 * basicDataSource.setPassword("dogiver0406!"); basicDataSource.setMaxTotal(20);
	 * basicDataSource.setMaxIdle(3); return basicDataSource; }
	 */
    
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
}

package com.spare.dogiver.config;

import java.util.List;
import java.util.Arrays;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Configuration
@MapperScan(basePackages = {"com.spare.dogiver.mapper"})
public class DataSourceConfig {
	private final Environment env;
	
    @Bean
    @Profile("dev")
    public DataSource devDataSource() {

    	String driverClassName = "net.sf.log4jdbc.sql.jdbcapi.DriverSpy";
    	String jdbcUrl = "jdbc:log4jdbc:h2:~/dogiver;DB_CLOSE_DELAY=-1;";
    	String username = "sa";
    	String password = "";
    	
    	
    	HikariConfig hikariConfig = new HikariConfig();
    	hikariConfig.setDriverClassName(driverClassName);
    	hikariConfig.setJdbcUrl(jdbcUrl);
        hikariConfig.setUsername(username);
        hikariConfig.setPassword(password);
        
        HikariDataSource dataSource = new HikariDataSource(hikariConfig);
        Resource schema = new ClassPathResource("sql/db-schema.sql");
        Resource testData = new ClassPathResource("sql/db-test-data.sql");
        ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
        populator.addScript(schema);
        populator.addScript(testData);
        DatabasePopulatorUtils.execute(populator, dataSource);
        return dataSource;
    }
    @Bean
    @Profile("prod")
    public DataSource prodDataSource() {

//    	String driverClassName = "oracle.jdbc.driver.OracleDriver";
    	String driverClassName = "net.sf.log4jdbc.sql.jdbcapi.DriverSpy";
    	String jdbcUrl = "jdbc:log4jdbc:oracle:thin:@dogiver.cnlfhnhpcnuu.ap-northeast-2.rds.amazonaws.com:1521:orcl";
        String username = "dogiver";
        String password = "dogiver0406!";
        
        HikariConfig hikariConfig = new HikariConfig();
    	hikariConfig.setDriverClassName(driverClassName);
    	hikariConfig.setJdbcUrl(jdbcUrl);
        hikariConfig.setUsername(username);
        hikariConfig.setPassword(password);
        
        HikariDataSource dataSource = new HikariDataSource(hikariConfig);
        
    	return dataSource;
    }
    
    public DataSource getDataSource() {
        List<String> profiles = Arrays.asList(env.getActiveProfiles());
        System.out.println(profiles.get(0));
        if(profiles.get(0).equals("dev")) return devDataSource();
        return prodDataSource();
    }
    
    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
    	SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
    	PathMatchingResourcePatternResolver pmrpr = new PathMatchingResourcePatternResolver();
    	DataSource dataSource = getDataSource();
    	sqlSessionFactory.setDataSource(dataSource);
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
		DataSource dataSource = getDataSource();
		dstm.setDataSource(dataSource);
		return dstm;
	}
}

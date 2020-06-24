package com.spare.dogiver;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations = {"classpath:spring/dataSource-test-context.xml"})
public class MyBatisTest {
	private static final Logger log = LoggerFactory.getLogger(MyBatisTest.class);
	
	@Autowired
	private SqlSessionFactory sessionFactory;
	
	@Test
	public void testSessionFactory() {
		log.info("\n Session Factory:" + sessionFactory);
	}
	
	@Test
	public void testSqlSession() {
		try(SqlSession session = sessionFactory.openSession()){
			log.info("\n Sql Session: "+session);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

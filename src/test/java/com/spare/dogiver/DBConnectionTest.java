package com.spare.dogiver;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringRunner.class)
@ContextConfiguration("classpath:spring/dataSource-test-context.xml")
public class DBConnectionTest {
	
	@Autowired
	private DataSource ds;
	
	@Test
	public void testConnection() {
		try(Connection conn = ds.getConnection()) {
			log.info("\n H2 DB 연결 : " + conn);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}

package com.spare.dogiver.web;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.junit.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.spare.dogiver.MainController;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
		,"file:src/main/webapp/WEB-INF/spring/security-context.xml"
		,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})

public class ControllerTest {
	@InjectMocks
    private MainController mainController;
    @Autowired
    protected WebApplicationContext wac;
    private MockMvc mvc;
    @Before
    public void setUp() throws Exception {
    	this.mvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
    }
    @Test
    public void returnIndexTest() throws Exception{
    	mvc.perform(get("/main/index"))
    	.andExpect(status().isOk())
    	.andExpect(view().name("index"));		
    }
    
}

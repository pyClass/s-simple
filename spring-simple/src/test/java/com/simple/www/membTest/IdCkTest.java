package com.simple.www.membTest;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.simple.www.controller.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/appServlet/van-servlet.xml", "file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@WebAppConfiguration
public class IdCkTest {
	@Inject
	Member memb;
	
	@Test
	public void testIdPw() {
		String tid = null;
		String tpw = null;
		memb.testTest(tid, tpw);
	}
}

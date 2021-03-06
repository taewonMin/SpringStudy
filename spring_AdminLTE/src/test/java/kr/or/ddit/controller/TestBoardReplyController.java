package kr.or.ddit.controller;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:kr/or/ddit/context/root-context.xml",
								 "classpath:kr/or/ddit/context/servlet-context.xml"})
@WebAppConfiguration
public class TestBoardReplyController {

	@Autowired
	private WebApplicationContext ctx; 	// WAS(Tomcat) 역할
	
	private MockMvc mockMvc;	// 브라우저 역할
	
	@Before
	public void setUp() {
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testListPage() throws Exception {
		mockMvc.perform(get("/replies/28691/1"))
						.andExpect(status().isOk())
						.andExpect(jsonPath("$.replyList[0].bno", equalTo(28691)))
						.andExpect(jsonPath("$.pageMaker.cri.page", equalTo(1)))
						.andExpect(jsonPath("$.pageMaker.totalCount", equalTo(10)));
	}
}

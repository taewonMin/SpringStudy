package kr.or.ddit.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:kr/or/ddit/context/root-context.xml",
								  "classpath:kr/or/ddit/context/servlet-context.xml"
								  })
@WebAppConfiguration
@Transactional() // 항상 rollback : no-rollback -> @Rollback(false)
public class TestBoardController {

	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setUp() {
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testModifyGET() throws Exception {
		mockMvc.perform(get("/board/modifyForm").param("bno", "17461"))
						.andExpect(status().isOk())
						.andExpect(model().attributeExists("board"))
						.andExpect(view().name("board/modify"));
	}
	
	@Test
	@Rollback(false)
	public void testModifyPOST() throws Exception{
		mockMvc.perform(post("/board/modify").param("bno", "17462")
											 .param("title", "제목수정")
											 .param("writer", "mimi")
											 .param("content", "내용수정"))
				.andExpect(status().isOk());
				//.andExpect(status().isFound());	// 302 응답코드 확인 및 Result 유무
				//.andExpect(redirectedUrl("/board/list"));
	}
	
	@Test
	public void testDetail() throws Exception {
		mockMvc.perform(get("/board/detail").param("bno", "17462"))
				.andExpect(status().isOk())
				.andExpect(model().attributeExists("board"))
				.andExpect(view().name("board/detail"));
	}
	
	@Test
	public void testRemove() throws Exception {
		mockMvc.perform(post("/board/remove").param("bno", "17462"))
		.andExpect(status().isOk());
		//.andExpect(redirectedUrl("/board/list"));
	}
}

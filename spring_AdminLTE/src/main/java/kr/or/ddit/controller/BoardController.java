package kr.or.ddit.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.BoardVO;
import kr.or.ddit.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/main")
	public void main() throws Exception {}
	
	@RequestMapping("/list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv) throws SQLException {
		String url = "board/list";
		
		Map<String, Object> dataMap = service.getBoardList(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/registForm")
	public String registForm() {
		String url="board/regist";
		
		return url;
	}
	
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public String regist(BoardVO board, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url="board/regist_success";
		
		try {
			service.regist(board);
		}catch(SQLException e) {
			e.printStackTrace();
			url="board/regist_fail";
			throw e;
		}
		
		return url;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(int bno, String from, ModelAndView mnv) throws SQLException {
		String url="board/detail";
		
		BoardVO board = null;
		if(from!=null && from.equals("modify")) {
			board=service.getBoardForModify(bno);
		}else {
			board=service.getBoard(bno);
		}
		
		mnv.addObject("board",board);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(int bno, ModelAndView mnv) throws SQLException {
		String url = "board/modify";
		
		BoardVO board = service.getBoardForModify(bno);
		
		mnv.addObject("board",board);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public void modifyPost(BoardVO board,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		service.modify(board);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();");
		out.println("location.href='detail?bno="+board.getBno()+"&from=modify';");
		out.println("</script>");
		
		out.close();
	}
	
	@RequestMapping(value="/remove",method=RequestMethod.GET)
	public void remove(int bno,HttpServletResponse response) throws Exception {
		
		service.remove(bno);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();window.close();");
		out.println("</script>");
		
		out.close();
	}
}

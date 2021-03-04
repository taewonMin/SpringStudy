package kr.or.ddit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/main")
	public void main() {}
	
	@RequestMapping("/list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv) throws SQLException {
		String url ="member/list";
		
		Map<String,Object> dataMap = memberService.getSearchMemberList(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/registForm",method=RequestMethod.GET)
	public String registForm() {
		String url = "member/regist";
		return url;
	}
	
	@Resource(name="picturePath")
	private String picturePath;
	
	@RequestMapping(value="/picture",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> picture(@RequestParam("pictureFile") MultipartFile multi, String oldPicture) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		String result = "";
		HttpStatus status = null;
		
		// 파일 저장 확인
		if((result = savePicture(oldPicture, multi)) == null) {
			result = "업로드 실패했습니다!";
			status = HttpStatus.BAD_REQUEST;
		}else {
			status = HttpStatus.OK;
		}
		
		entity = new ResponseEntity<String>(result,status);
		
		return entity;
	}
	
	 private String savePicture(String oldPicture, MultipartFile multi) throws Exception {
		 String fileName = null;
		 
		 // 파일 유무 확인
		 if(!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {
			 
			 // 파일 저장 폴더 설정
			 String uploadPath = picturePath;
			 fileName = UUID.randomUUID().toString().replace("-", "") + ".jpg";
			 File storeFile = new File(uploadPath, fileName);
			 
			 storeFile.mkdirs();
			 
			 // local HDD에 저장
			 multi.transferTo(storeFile);
			 
			 if (!oldPicture.isEmpty()) {
				 File oldFile = new File(uploadPath, oldPicture);
				 if(oldFile.exists()) {
					 oldFile.delete();
				 }
			 }
		 }
		 
		 return fileName; 
	 }
	 
	 @RequestMapping(value="/getPicture",produces="text/plain;charset=utf-8")
	 @ResponseBody
	 public ResponseEntity<byte[]> getPicture(String picture) throws Exception {
		 InputStream in = null;
		 ResponseEntity<byte[]> entity = null;
		 String imgPath = this.picturePath;
		 try {
			 
			 // in = new FileInputStream(imgPath+File.separator+picture);
			 in = new FileInputStream(new File(imgPath, picture));
			 
			 entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		 } catch(IOException e) {
			 e.printStackTrace();
			 entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		 } finally {
			 in.close();
		 }
		 return entity;
	 }
	 
	 @RequestMapping("/idCheck")
	 @ResponseBody
	 public ResponseEntity<String> idCheck(String id) throws Exception {
		 ResponseEntity<String> entity = null;
		 
		 try {
			 MemberVO member = memberService.getMember(id);
			 
			 if(member!=null) {
				 entity = new ResponseEntity<String>("duplicated",HttpStatus.OK);
			 }else {
				 entity = new ResponseEntity<String>("",HttpStatus.OK);
			 }
		 } catch(SQLException e) {
			 entity = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		 }
		 
		 return entity;
		 
	 }
	 
	 
}

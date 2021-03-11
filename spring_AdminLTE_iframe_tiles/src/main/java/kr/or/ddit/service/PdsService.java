package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.PdsVO;

public interface PdsService {

	// 리스트조회
	Map<String,Object> getList(SearchCriteria cri) throws SQLException;
	
	// 글조회
	PdsVO getPdsForModify(int pno) throws SQLException;
	
	// 글작성
	void regist(PdsVO pds) throws SQLException;
	
	// 글수정
	void modify(PdsVO pds) throws SQLException;
	
	// 글삭제
	void remove(int pno) throws SQLException;
	
	// 글읽기(조회수 증가)
	PdsVO getPds(int pno) throws SQLException;
	
	// file 찾기
	PdsVO findPds(String fileName) throws SQLException;
}

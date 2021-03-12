<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<head>
<style>
	
	table th,td{
		text-align:center;		
	}
	
</style>
</head>


    <!-- Main content -->
    <section class="content">		
		<div class="card">
			<div class="card-header with-border">
				<button type="button" class="btn btn-primary" id="registBtn" onclick="OpenWindow('registForm','글등록',800,700);">글등록</button>				
				<div id="keyword" class="card-tools" style="width:550px;">
					<div class="input-group row">
						<select class="form-control col-md-3" name="perPageNum" id="perPageNum" onChange="searchList_go(1);">
					   		<option value="10" >정렬개수</option>
					  		<option value="20" ${pageMaker.cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
					  		<option value="30" ${pageMaker.cri.perPageNum == 30 ? 'selected':''}>30개씩</option>
					  		<option value="50" ${pageMaker.cri.perPageNum == 50 ? 'selected':''}>50개씩</option>
					    </select>						
						<select class="form-control col-md-3" name="searchType" id="searchType">
							<option value="tcw" ${pageMaker.cri.searchType eq 'tcw' ? 'selected':''}>전 체</option>
							<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected':''}>제 목</option>
							<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected':''}>작성자</option>
							<option value="c" ${pageMaker.cri.searchType eq 'c' ? 'selected':''}>내 용</option>
							<option value="tc" ${pageMaker.cri.searchType eq 'tc' ? 'selected':''}>제목+내용</option>
							<option value="cw" ${pageMaker.cri.searchType eq 'cw' ? 'selected':''}>작성자+내용</option>		
						</select>
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${pageMaker.cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" onclick="searchList_go(1);" 
							data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>						
			</div>
			<div class="card-body">
				<table class="table table-bordered text-center" >					
					<tr style="font-size:0.95em;">
						<th style="width:10%;">번 호</th>
						<th style="width:50%;">제 목</th>
						<th style="width:10%;">작성자</th>
						<th style="width:10%;">첨부파일</th>
						<th style="width:10%;">등록일</th>
						<th style="width:10%;">조회수</th>
					</tr>				
					<c:if test="${empty pdsList }">
						<tr>
							<td colspan="6">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>
					<c:forEach items="${pdsList }" var="pds">
						<tr style="font-size:0.85em;">
		               		<td>${pds.pno }</td>
		               		<td style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
		               		<a href="javascript:OpenWindow('detail?pno=${pds.pno}','상세보기','800','600');">${pds.title }</a>
		               		</td>
		               		<td>${pds.writer }</td>
		               		<td><span class="badge bg-blue">${pds.attachList.size() }</span></td>
		               		<td><fmt:formatDate value="${pds.regDate }" pattern="yyyy-MM-dd"/></td>
		               		<td><span class="badge bg-red">${pds.viewcnt }</span></td>
		               	</tr>
					</c:forEach>
				</table>				
			</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
			</div>
		</div>
		
    </section>
    <!-- /.content -->

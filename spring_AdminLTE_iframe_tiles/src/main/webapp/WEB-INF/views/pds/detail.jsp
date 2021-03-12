<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    

<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

  <!-- Content Wrapper. Contains page content -->
  
<body>
     <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9">
				<div class="card card-outline card-primary">
					<div class="card-header">
						<h3 class="card-title">상세보기</h3>
						<div class="card-tools">
							<c:if test="${loginUser.id eq pds.writer }">
								<button type="button" id="modifyBtn" class="btn btn-warning">Modify</button>						
						    	<button type="button" id="removeBtn" class="btn btn-danger">REMOVE</button>
							</c:if>
						    <button type="button" id="listBtn" class="btn btn-primary" onclick="CloseWindow();">CLOSE </button>
						</div>
					</div>
					<div class="card-body">
						<div class="form-group col-sm-12">
							<label for="title">제 목</label>
							<input type="text" class="form-control" id="title" value="${pds.title }" readonly />							
						</div>	
						<div class="col-sm-12 row">
							<div class="form-group col-sm-4" >
								<label for="writer">작성자</label>
								<input type="text" class="form-control" id="writer" value="${pds.writer }" readonly />
							</div>		
							
							<div class="form-group col-sm-4" >
								<label for="regDate">작성일</label>
								<input type="text" class="form-control" id="regDate" 
									value="<fmt:formatDate value="${pds.regDate }" pattern="yyyy-MM-dd" />" readonly />
							</div>	
							<div class="form-group col-sm-4" >
								<label for="viewcnt">조회수</label>
								<input type="text" class="form-control" id="viewcnt" value="${pds.viewcnt }"
									 readonly />
							</div>	
						</div>	
						<div class="form-group col-sm-12">
							<label for="content">내 용</label>
							<div id="content">${pds.content}</div>	
						</div>
						<div class="form-group col-sm-12">
							<div class="card card-outline card-success">
								<div class="card-header">
									<h3>첨부파일</h3>
								</div>			
								<div class="card-footer">
									<div class="row">
										<c:forEach items="${pds.attachList }" var="attach">
											<div class="col-md-4 col-sm-4 col-xs-12" style="cursor:pointer;"
											onclick="location.href='getFile.do?ano=${attach.ano }';"
											>
												<div class="info-box">
													<span class="info-box-icon bg-yellow">
														<i class="fa fa-copy"></i>
													</span>
													<div class="info-box-content">
														<span class="info-box-text">
															<fmt:formatDate value="${attach.regDate }" pattern="yyyy-MM-dd"/>
														</span>
														<span class="info-box-number">${attach.fileName }</span>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row  -->		
		
		<script>
		
		</script>
    </section>
    <!-- /.content -->
    
    <%@ include file="./detail_js.jsp" %>
</body>
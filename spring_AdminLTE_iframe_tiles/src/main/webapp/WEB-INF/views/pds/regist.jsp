<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body class="hold-transition sidebar-mini">
   <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h4>글등록</h4>
						<div class="card-tools">
							<button type="button" class="btn btn-primary" id="registBtn">등 록</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn" id="cancelBtn" onclick="CloseWindow();">취 소</button>
						</div>
					</div><!--end card-header  -->
					<div class="card-body">
						<form enctype="multipart/form-data" role="form" method="post" action="regist.do" name="registForm">
							<div class="form-group">
								<label for="writer">작성자</label> 
								<input type="text" id="writer" readonly
									name="writer" class="form-control" value="${loginUser.id }">
							</div>
							<div class="form-group">
								<label for="title">제 목</label> 
								<input type="text" id="title"
									name='title' class="form-control" placeholder="제목을 쓰세요">
							</div>
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea class="form-control" name="content" id="content" rows="5"
									placeholder="1000자 내외로 작성하세요."></textarea>
							</div>
							<div class="form-group">								
								<div class="card card-outline card-success">
									<div class="card-header">
										<h5 style="display:inline;line-height:40px;">첨부파일 : </h5>
										&nbsp;&nbsp;
										<button class="btn btn-xs btn-primary" type="button" id="addFileBtn">Add File</button>
									</div>									
									<div class="card-footer fileInput">
									</div>
								</div>
							</div>
						</form>
					</div><!--end card-body  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    
    <script>
    	window.onload=function(){
    		attach_js();
    		regist_submit();
    		summernote_start($('#content'), '<%=request.getContextPath()%>');
    	}
    </script>
    
    <%@ include file="./regist_js.jsp" %>
    <%@ include file="./regist_attach_js.jsp" %>
    
</body>
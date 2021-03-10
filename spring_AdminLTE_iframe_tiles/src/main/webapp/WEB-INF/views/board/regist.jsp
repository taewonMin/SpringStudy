<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>게시글 등록</title>

<body class="hold-transition sidebar-mini">
  <!-- Content Wrapper. Contains page content -->
  <div style="width:100%;">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Free Board</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">목 록</a></li>
              <li class="breadcrumb-item active">Free Board</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content container-fluid">
      <div class="row justify-content-center">
         <div class="col-md-9" style="max-width:960px;">
            <div class="card card-outline card-info">
               <div class="card-header">
                  <h3 class="card-title p-1">글등록</h3>
                  <div class ="card-tools">
                     <button type="button" class="btn btn-primary" id="registBtn" onclick="submit_go();">등 록</button>
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <button type="button" class="btn btn-warning" id="cancelBtn" onclick="CloseWindow();">취 소</button>
                  </div>
               </div><!--end card-header  -->
               <div class="card-body pad">
                  <form role="form" method="post" action="regist.do" name="registForm" enctype="multipart/form-data">
                     <div class="form-group">
                        <label for="title">제 목</label> 
                        <input type="text" id="title"
                           name='title' class="form-control" placeholder="제목을 쓰세요">
                     </div>                     
                     <div class="form-group">
                        <label for="writer">작성자</label> 
                        <input type="text" id="writer" name="writer" class="form-control" value="${loginUser.id }" readonly="readonly">
                     </div>
                     <div class="form-group">
                        <label for="content">내 용</label>
                        <textarea class="textarea" name="content" id="content" rows="20"
                           placeholder="1000자 내외로 작성하세요." style="display: none;"></textarea>
                     </div>
                  </form>
               </div><!--end card-body  -->
               <div class="card-footer" style="display:none">
                  
               </div><!--end card-footer  -->
            </div><!-- end card -->            
         </div><!-- end col-md-12 -->
      </div><!-- end row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->



<script>
window.onload=function(){
	summernote_start('#content','<%= request.getContextPath() %>');
}

function submit_go(){
	
	var form = document.registForm;
	if(form.title.value==""){
		form.title.focus();
		alert("제목은 필수입니다.");
		return;
	}
	
	var files = $('input[name="uploadFile"]');
	for(var file of files){
		console.log(file.name + " : " + file.value);
		if(file.value==""){
			alert("파일을 선택하세요.");
			file.focus();
			file.click();
			return;
		}
	}
	
	form.submit();
}
</script>

</body>
</html>
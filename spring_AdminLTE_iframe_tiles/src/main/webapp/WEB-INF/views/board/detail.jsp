<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>상세 페이지</title>

<body class="hold-transition sidebar-mini">

  <!-- Content Wrapper. Contains page content -->
  <div style="width:100%;">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Board Detail</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">상세보기</a></li>
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
			<div class="col-md-9">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title">상세보기</h3>
						<div class="card-tools">
							<button type="button" id="modifyBtn" class="btn btn-warning" onclick="modify_go();">MODIFY</button>						
						    <button type="button" id="removeBtn" class="btn btn-danger" onclick="remove_go();">REMOVE</button>					    
						    <button type="button" id="listBtn" class="btn btn-primary" onclick="CloseWindow();">CLOSE</button>
						</div>
					</div>
					<div class="card-body">
						<div class="form-group col-sm-12">
							<label for="title">제 목</label>
							<input type="text" class="form-control" id="title" value="${board.title }" readonly />							
						</div>
						<div class="row">	
							<div class="form-group col-sm-4" >
								<label for="writer">작성자</label>
								<input type="text" class="form-control" id="writer" value="${board.writer }" readonly />
							</div>		
							
							<div class="form-group col-sm-4" >
								<label for="regDate">작성일</label>
								<input type="text" class="form-control" id="regDate" value="<fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd" />" readonly />
							</div>
							<div class="form-group col-sm-4" >
								<label for="viewcnt">조회수</label>
								<input type="text" class="form-control" id="viewcnt" value="${board.viewcnt }" readonly />
							</div>
						</div>		
						<div class="form-group col-sm-12">
							<label for="content">내 용</label>
							<div id="content">${board.content }</div>	
						</div>						
					</div>
												
				</div><!-- end card -->				
			</div><!-- end col-md-9 -->
		</div><!-- end row  -->
		
		<!-- reply component start --> 
		<div class="row justify-content-center">
			<div class="col-md-9">
				<div class="card card-info">					
					<div class="card-body">
						<!-- The time line -->
						<div class="timeline" id="repliesDiv">
							<!-- timeline time label -->
							<div class="time-label" >
								<span class="bg-green">Replies List </span>							
							</div>
							
						</div>
						<div class='text-center'>
							<ul id="pagination" class="pagination justify-content-center m-0">
								
							</ul>
						</div>
					</div>
					<div class="card-footer">
						<input class="form-control" type="hidden" placeholder="USER ID"	 id="newReplyWriter" value="${loginUser.id }"> 
						<label for="newReplyText">Reply Text</label>
						<input class="form-control" type="text"	placeholder="REPLY TEXT" id="newReplyText">
						<br/>
						<button type="button" class="btn btn-primary" onclick="replyRegist_go();" id="replyAddBtn">ADD REPLY</button>
					</div>				
				</div>			
				
			</div><!-- end col-md-9 -->
		</div><!-- end row -->
		
		
    </section>
    <!-- /.section -->
  </div>
  <!-- /.content-wrapper -->



<!-- Modal -->
<div id="modifyModal" class="modal modal-default fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" style="display:none;"></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body" data-rno>
      	<form role="frm">
	      	<input type="hidden" name="rno" id="rno">
	      	<input type="hidden" name="replyer" id="replyer">
	        <p><input type="text" name="replytext" id="replytext" class="form-control"></p>
      	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

function modify_go(){
	location.href="modifyForm.do?bno=${board.bno}";
}

function remove_go(){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="remove.do?bno=${board.bno}";
	}
}

</script>

<%@ include file="detail_reply.jsp" %>

</body>
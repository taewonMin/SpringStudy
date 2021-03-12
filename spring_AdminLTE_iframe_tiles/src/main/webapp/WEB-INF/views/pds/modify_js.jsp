<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<script>
	window.onload=function(){
		summernote_start($('#content'),'<%=request.getContextPath()%>');
	}
</script>
   
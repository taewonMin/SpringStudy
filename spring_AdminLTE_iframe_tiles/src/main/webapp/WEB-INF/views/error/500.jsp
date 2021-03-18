<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<script>
	alert("서버장애가 발생했습니다.\n관리자에게 연락바랍니다.\nerror : ${exception.message}");
	history.go(-1);
</script>
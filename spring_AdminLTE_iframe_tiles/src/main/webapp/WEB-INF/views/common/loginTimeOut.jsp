<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	alert("세선이 만료되었습니다.\n다시 로그인 하세요!");
	location.href="<%=request.getContextPath()%>";
</script>
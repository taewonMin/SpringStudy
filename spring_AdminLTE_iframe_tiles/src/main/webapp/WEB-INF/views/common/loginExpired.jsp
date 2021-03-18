<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<script>
	alert("중복 로그인이 확인되었습니다.\n다시 로그인하면 다른 장치에서 로그인은 취소됩니다!");
	location.href="<%=request.getContextPath()%>";
</script>
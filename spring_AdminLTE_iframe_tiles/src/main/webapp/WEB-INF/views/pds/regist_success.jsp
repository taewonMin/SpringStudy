<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	alert('정상적으로 등록되었습니다.');
	if(window.opener){
		window.opener.location.href='<%=request.getContextPath()%>/pds/list';
		window.close();
	}
</script>
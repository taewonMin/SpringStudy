<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
alert('수정되었습니다.');
location.href='detail?pno=${pno}&from=modify';
window.opener.location.reload(true);
</script>
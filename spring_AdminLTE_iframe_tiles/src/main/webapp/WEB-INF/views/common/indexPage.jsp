<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<body>
  <div class="content-wrapper">
	  <iframe name="ifr" src="" frameborder="0" style="width:100%;height:85vh;"></iframe>
  </div>
  
<!-- main -->
<script src="<%=request.getContextPath() %>/resources/js/main/main.js"></script>

<script type="text/x-handlebars-template" id="subMenu-list-template">
{{#each .}}

<li class="nav-item subMenu">
	<a href="javascript:goPage('<%=request.getContextPath()%>{{murl}}', '{{mcode}}');initPageParam();" class="nav-link">
		<i class="{{micon}}"></i>
		<p>{{mname}}</p>
	</a>
</li>

{{/each}}
</script>

<script>
window.onload=function(){
	goPage('<%=request.getContextPath()%>${menu.murl}','${menu.mcode}');
	subMenu('${menu.mcode}'.substring(0,3)+"0000",'<%=request.getContextPath()%>');
}
</script>

</body>
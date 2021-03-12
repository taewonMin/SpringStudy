<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
function regist_submit(){
	$('#registBtn').on('click',function(e){
// 		alert('submit btn click');

		// 파일 유무 확인
		var files = $('input[name="uploadFile"]');
		for(var file of files){
			console.log(file.name+" : "+file.value);
			if(file.value==""){
				alert("파일을 선택하세요.");
				file.focus();
				file.click();
				return;
			}
		}
		
		if($("input[name='title']").val()==""){	// form.title.value
			alert("제목은 필수입니다.");
			$("input[name='title']").focus();
			return;
		}
		
		document.registForm.submit();
	});
}
</script>
function subMenu(mcode,contextPath){
	if(mcode!="M000000"){
		// $.getJSON(data, url, successFunc()){}
		$.getJSON(contextPath+"/common/subMenu.do?mCode="+mcode,function(data){
			printData(data,$(".subMenuList"),$("#subMenu-list-template"),'.subMenu');
		});
	}else{
		$(".subMenuList").html("");
	}
}

function goPage(url,mCode){
	//HTML5 지원브라우저에서 사용가능
	if(typeof(history.pushState) == 'function'){
		//현재 주소를 가져온다.
		var renewURL = location.href;
		//현재 주소중 .do 뒤 부분이 있다면 날려버린다.
		renewURL = renewURL.substring(0, renewURL.indexOf(".do")+3);
		
		if(mCode != 'M000000'){
			renewURL += "?mCode="+mCode;
		}
		//페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
		history.pushState(mCode, null, renewURL);
		
	}else{
		location.hash = "#" + mCode;
	}
	
	$('iframe[name="ifr"]').attr("src",url);
}
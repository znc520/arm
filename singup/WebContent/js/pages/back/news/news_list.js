$(function(){
	$(selall).on("click",function(){
		checkboxSelectAll("nid",this.checked) ;
	}) ;
	$(removeBtn).on("click",function(){
		var elename = "nid" ;
		var url = "admin/news/remove.action" ;
		var ids = "" ;
		var deleteArray = new Array() ;
		var foot = 0 ;
		$("input[id='"+elename+"']:checked").each(function() {
			ids += $(this).val() + "|" ;
			deleteArray[foot ++] = $(this).val() ;
		}) ;
		if (ids == "") {
			$("#alertDiv").attr("class","alert alert-danger") ;
	        $("#alertText").text("您还未选择任何数据，请确认您的操作！") ;
			$("#alertDiv").fadeIn(1000,function(){
	            $("#alertDiv").fadeOut(3000) ;
	        }) ;
		} else {
			if (window.confirm("您确定要继续执行此操作吗？")) {
				url += "?ids=" + ids ;
				$.post(url,{},function(data){
					var flag = data.trim()=="true" ;
					operateAlert(flag,"新闻数据删除成功！","新闻数据删除失败！") ;
					if (flag) {
						for (var x = 0 ; x < deleteArray.length ; x ++) {
							$("#tr-" + deleteArray[x]).remove() ;
						}
					}
				},"text") ;
			}
		}
	}) ;
})
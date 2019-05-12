function loadCount() {
	$.post("admin/bespeak/count.action",{},function(data){
		$(allBespeak).html("<a href='admin/bespeak/list.action?type=all'><span class='text-info'>" + data.stat.all + "</span></a>") ;
		$(status0Bespeak).html("<a href='admin/bespeak/wait.action?type=new'><span class='text-danger h2'>" + data.stat.status0 + "</span></a>") ;
		$(status1Bespeak).html("<a href='admin/bespeak/finish.action?type=finish'><span class='text-primary'>" + data.stat.status1 + "</span></a>") ;
		$(status2Bespeak).html("<a href='admin/bespeak/invalid.action?type=invalid'><span class='text-default'>" + data.stat.status2 + "</span></a>") ;
	},"json") ;
}

$(function() {

	$(createNewsBut).on("click",function() {
		$.post("admin/news/create.action",{},function(data){
			operateAlert(true , "公告静态数据创建成功！" ,"") ;
		},"text") ;
	}) ;
	
	$(createBespeakBut).on("click",function() {
		$.post("admin/dict/create.action",{},function(data){
			operateAlert(true , "报名数据创建成功！" ,"报名数据创建失败！") ;
		},"text") ;
	}) ;
	loadCount() ;
})



	
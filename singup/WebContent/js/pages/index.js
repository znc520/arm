$(function() {
	$(createNewsBut).on("click",function() {
		$.post("admin/news/create.action",{},function(data){
			operateAlert(true , "公告静态数据创建成功！" ,"") ;
		},"text") ;
	}) ;
})
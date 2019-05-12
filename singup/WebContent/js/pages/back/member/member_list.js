var formVar ;
function myResetForm () {
	formVar.resetForm() ;
	$(passwordDiv).attr("class","form-group") ;
	$(passwordMsg).text("*") ;
}
$(function(){   
	$("input[id*=lockBut-]").each(function(){
		var mid = this.id.split("-") [1] ;
		var inputObj = $(this) ;	// 保存当前的对象
		// console.log("mid = " + mid + "、status = " + status) ;
		$(this).on("click",function(){
			var locked = 0 ;	// 默认的状态
			if (inputObj.attr("locked") == "0") {	// 当前为活跃状态
				locked = 1 ; 	// 修改为1表示锁定状态
			}  
			if (window.confirm("您确定要修改该用户状态吗？")) {
				$.post("admin/member/editLocked.action",{"mid":mid,"locked":locked},
					function(data){
					var temp = "" ;
					if (locked == 0) {	// 当前为活跃状态
						temp = "用户的状态已经修改成功为活跃！" ;
						inputObj.attr("value","锁定用户") ;
						inputObj.attr("class","btn btn-xs btn-danger") ;
						$("#status-" + mid).html("<span class='text-success'>活跃</span>") ;
					} else {
						temp = "用户的状态已经修改成功为锁定！" ;
						inputObj.attr("value","激活用户") ;
						inputObj.attr("class","btn btn-xs btn-success") ;
						$("#status-" + mid).html("<span class='text-danger'>锁定</span>") ;
					}
					inputObj.attr("locked",locked) ;
					operateAlert(data.trim() == "true" , temp ,"用户状态修改失败， 请确认您的权限！") ;
				},"text") ; 
				// console.log(statusValue) ;
			}
		}) ;
	}) ;
	$("input[id*=changeBut-]").each(function(){
		var mid = this.id.split("-") [1] ;
		// console.log("mid = " + mid) ;
		$(this).on("click",function(){
			$(midTitleSpan).text(mid) ;
			$(cpmid).val(mid) ;
			$(password).val("") ;
			myResetForm() ;
			$(memberPasswordInfo).modal("toggle") ;
		}) ;
	}) ;
	formVar = $("#myform").validate({
		debug : true, // 取消表单的提交操作
		submitHandler : function(form) {
			// console.log("mid = " + $(cpmid).val() + "，password = " + $(password).val()) ;
			$.post("admin/member/editPasswordByAdmin.action",{"mid":$(cpmid).val(),"password":$(password).val()},function(data){
				$(memberPasswordInfo).modal("toggle") ;
				operateAlert(data.trim() == "true" , "用户登录密码修改成功！","用户登录密码修改失败，请确认您的级别！") ;
			},"text") ;
		},
		errorPlacement : function(error, element) {
			$("#" + $(element).attr("id").replace(".", "\\.") + "Msg").append(error);
		},
		highlight : function(element, errorClass) {
			$(element).fadeOut(1,function() {
				$(element).fadeIn(1, function() {
					$("#" + $(element).attr("id").replace(".","\\.") + "Div").attr("class","form-group has-error");
				});

			})
		},
		unhighlight : function(element, errorClass) {
			$(element).fadeOut(1,function() {
				$(element).fadeIn(1,function() {
						$("#" + $(element).attr("id").replace(".","\\.") + "Div").attr("class","form-group has-success");
				});
			})
		},
		errorClass : "text-danger",
		rules : {
			"password" : { 
				required : true
			} 
		}
	});
})
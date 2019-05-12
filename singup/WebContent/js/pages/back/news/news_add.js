$(function(){
	tinymce.init({ selector:'#note' });
	$("#myform").validate({
		debug : true, // 取消表单的提交操作
		submitHandler : function(form) {
			form.submit(); // 提交表单
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
		messages : {
			"title" : {
				remote : "该新闻标题已经存在，请更换"
			}
		} ,
		errorClass : "text-danger",
		rules : {
			"title" : {
				required : true 
			},
			"abs" : { 
				required : true
			},
			"dtid" : { 
				required : true
			} ,
			"pic" : { 
				extension : "png|jpg|gif|bmp" 
			} ,
			"content" : { 
				required : true
			} ,
			"flag" : { 
				required : true
			}
		}
	});
})
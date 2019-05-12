$(function() {
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
			"mid" : {
				remote : "该用户id已经存在，无法使用！"
			}
		} ,
		errorClass : "text-danger",
		rules : {
			"mid" : {
				required : true ,
				remote : {
					url : "admin/member/checkMid.action", // 后台处理程序
					type : "post", // 数据发送方式
					dataType : "html", // 接受数据格式
					data : { // 要传递的数据
						mid : function() {
							return $("#mid").val();
						}
					},
					dataFilter : function(data, type) {
						if (data.trim() == "true") {
							return true;
						} else { 
							return false;
						}
					}
				}
			},
			"name" : { 
				required : true
			},
			"password" : { 
				required : true
			} ,
			"rid" : { 
				required : true
			}
		}
	});
})
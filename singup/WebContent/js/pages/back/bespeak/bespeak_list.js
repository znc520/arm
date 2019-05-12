
$(function(){
	
	$("button[id*=invalidBut-]").each(function() {
		var bid = this.id.split("-") [1] ;

		$(this).on("click",function(){
			$.post("admin/bespeak/editStatus.action",{beid:bid,status:2},function(data){
				if(data.trim()=="true"){
					$("#bespeak-"+bid).remove();
				}
				operateAlert(data.trim() == "true" , "报名信息已弃废！！","报名信息弃废失败！") ;
			},"text");
		});
	});
	$("a[id*=showBespeakInfo]").each(function() {
		var bid = this.id.split("-") [1] ;
		var name = $(this).text() ;
		$(this).on("click",function(){
			$.post("admin/bespeak/show.action",{beid:bid},function(data){
			
				if (data.bespeak.name != undefined) {	// 现在有数据返回
					$(currBid).val(bid) ;
					$(nameTitleSpan).text(name) ;
					$(modalName).text(data.bespeak.name) ;
					$(modalPhone).text(data.bespeak.phone) ;
					$(modalSource).text(data.bespeak.src) ;
					$(modalEdu).text(data.bespeak.edu) ;
					$(modalSchool).text(data.bespeak.school) ;
					$(modalIndate).text(new Date(data.bespeak.indate.time).format("yyyy-MM-dd hh:mm:ss.S")) ;
					$(modalBedate).text(new Date(data.bespeak.bedate.time).format("yyyy-MM-dd hh:mm:ss.S")) ;
					$(modalBenote).text(data.bespeak.benote) ;
					$(modalNote).text(data.bespeak.note) ;
					$(bespeakInfo).modal("toggle") ;
				} else {
					operateAlert(true , "报名信息加载失败！！","报名信息加载失败！！") ;
				}
			},"json") ;
		}) ;
	}) ;
	$("#myform").validate({
		debug : true, // 取消表单的提交操作
		submitHandler : function(form) {
			//console.log("bid = " + $(currBid).val() + "、newNote = " + $(newNote).val()) ;
			$.post("admin/bespeak/editNote.action",{beid:$(currBid).val(),"note":$(newNote).val()},function(data){
				operateAlert(data.trim()=="true" , "报名备注追加成功！","报名备注追加失败！") ;
				$(bespeakInfo).modal("toggle") ;
				
				
			},"text");  
		
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
			"newNote" : {
				required : true 
			}
		}
	});
})
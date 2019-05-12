<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/pages/plugins/include_static_head.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%
	String passwordMemberUrl = basePath + "pages/back/member/add.action" ;
%>
<jsp:include page="/pages/plugins/include_javascript_head.jsp" />
<script type="text/javascript" src="js/pages/back/member/member_password.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- 导入头部标题栏内容 -->
		<jsp:include page="/pages/plugins/include_title_head.jsp" />
		<!-- 导入左边菜单项 -->
		<jsp:include page="/pages/plugins/include_menu_item.jsp">
			<jsp:param name="role" value="member"/>
			<jsp:param name="action" value="member:add"/>
		</jsp:include>
		<div class="content-wrapper">
			<div class="panel panel-success">
				<div class="panel-heading">
					<strong><i class="fa fa-user-md"></i>&nbsp;修改管理员密码</strong>
				</div>
				<div class="panel-body">
					<form action="<%=passwordMemberUrl%>" id="myform" method="post" class="form-horizontal">
						<div class="form-group" id="oldpasswordDiv">
							<label class="col-md-2 control-label" for="oldpassword">原始密码：</label>
							<div class="col-md-5">
								<input type="password" name="oldpassword" id="oldpassword" class="form-control input-sm" placeholder="请输入原始登录密码...">
							</div>
							<div class="col-md-4" id="oldpasswordMsg">*</div>
						</div>
						<div class="form-group" id="newpasswordDiv">
							<label class="col-md-2 control-label" for="oldpassword">新的密码：</label>
							<div class="col-md-5">
								<input type="password" name="newpassword" id="newpassword" class="form-control input-sm" placeholder="请输入新的登录密码...">
							</div>
							<div class="col-md-4" id="newpasswordMsg">*</div>
						</div>
						<div class="form-group" id="confpasswordDiv">
							<label class="col-md-2 control-label" for="confpassword">确认密码：</label>
							<div class="col-md-5">
								<input type="password" name="confpassword" id="confpassword" class="form-control input-sm" placeholder="请重新输入新的登录密码...">
							</div>
							<div class="col-md-4" id="confpasswordMsg">*</div>
						</div>
						<div class="form-group"> 
							<div class="col-md-offset-2 col-md-5">
								<input type="submit" value="修改" class="btn btn btn-primary">
								<input type="reset" value="重置" class="btn btn btn-warning">
							</div>
						</div>
					</form>
				</div>
				<div class="panel-footer">
				</div>
			</div>
		</div>
		<!-- 导入公司尾部认证信息 -->
		<jsp:include page="/pages/plugins/include_title_foot.jsp" />
		<!-- 导入右边工具设置栏 -->
		<jsp:include page="/pages/plugins/include_menu_sidebar.jsp" />
		<div class="control-sidebar-bg"></div>
	</div>
	<jsp:include page="/pages/plugins/include_javascript_foot.jsp" />
</body>
</html>

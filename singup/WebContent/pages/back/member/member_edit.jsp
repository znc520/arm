<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/pages/plugins/include_static_head.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%
	String editMemberUrl = basePath + "pages/back/member/edit.action" ;
%>
<jsp:include page="/pages/plugins/include_javascript_head.jsp" />
<script type="text/javascript" src="js/pages/back/member/member_edit.js"></script>
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
					<strong><i class="fa fa-user-md"></i>&nbsp;编辑管理员账户</strong>
				</div>
				<div class="panel-body">
					<form action="<%=editMemberUrl%>" id="myform" method="post" class="form-horizontal">
						<div class="form-group" id="midDiv">
							<label class="col-md-2 control-label" for="mid">登录帐号：</label>
							<div class="col-md-5">
								<input type="text" name="mid" id="mid" class="form-control input-sm" placeholder="请输入雇员真实姓名">
							</div>
							<div class="col-md-4" id="midMsg">*</div>
						</div>
						<div class="form-group" id="nameDiv">
							<label class="col-md-2 control-label" for="name">真实姓名：</label>
							<div class="col-md-5">
								<input type="text" name="name" id="name" class="form-control input-sm" placeholder="请输入雇员真实姓名">
							</div>
							<div class="col-md-4" id="nameMsg">*</div>
						</div>
						<div class="form-group" id="passwordDiv">
							<label class="col-md-2 control-label" for="password">登录密码：</label>
							<div class="col-md-5">
								<input type="text" name="password" id="password" class="form-control input-sm" placeholder="请输入雇员真实姓名">
							</div>
							<div class="col-md-4" id="passwordMsg">*</div>
						</div>
						<div class="form-group" id="ridDiv">
							<label class="col-md-2 control-label" for="rid">用户角色：</label>
							<div class="col-md-5">
								<div class="checkbox-inline">
									<input type="checkbox" name="rid" id="rid" value="1">管理员
								</div>
								<div class="checkbox-inline">
									<input type="checkbox" name="rid" id="rid" value="1">公告管理
								</div>
								<div class="checkbox-inline">
									<input type="checkbox" name="rid" id="rid" value="2">预约管理
								</div>
								<div class="checkbox-inline">
									<input type="checkbox" name="rid" id="rid" value="3">系统设置
								</div>
							</div> 
							<div class="col-md-4" id="ridMsg">*</div>
						</div> 
						<div class="form-group"> 
							<div class="col-md-offset-2 col-md-5">
								<input type="hidden" name="mid" id="mid">
								<input type="submit" value="增加" class="btn btn btn-primary">
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

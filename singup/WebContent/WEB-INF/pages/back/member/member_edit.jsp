<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/plugins/include_static_head.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%
	String editMemberUrl = basePath + "admin/member/edit.action" ;
%>
<jsp:include page="/WEB-INF/pages/plugins/include_javascript_head.jsp" />
<script type="text/javascript" src="js/pages/back/member/member_edit.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- 导入头部标题栏内容 -->
		<jsp:include page="/WEB-INF/pages/plugins/include_title_head.jsp" />
		<!-- 导入左边菜单项 -->
		<jsp:include page="/WEB-INF/pages/plugins/include_menu_item.jsp">
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
								<input type="text" class="form-control input-sm" value="${member.mid}" disabled="disabled">
							</div>
							<div class="col-md-4" id="midMsg">*</div>
						</div>
						<div class="form-group" id="nameDiv">
							<label class="col-md-2 control-label" for="name">真实姓名：</label>
							<div class="col-md-5">
								<input type="text" name="name" id="name" value="${member.name}" class="form-control input-sm" placeholder="请输入用户真实姓名">
							</div>
							<div class="col-md-4" id="nameMsg">*</div>
						</div>
						<div class="form-group" id="passwordDiv">
							<label class="col-md-2 control-label" for="password">登录密码：</label>
							<div class="col-md-5">
								<input type="password" name="password" id="password" class="form-control input-sm" placeholder="请输入要修改的密码">
							</div>
							<div class="col-md-4" id="passwordMsg">*</div>
						</div>
						<div class="form-group" id="ridDiv">
							<label class="col-md-2 control-label" for="rid">用户角色：</label>
							<div class="col-md-5">
								<c:forEach items="${allRoles}" var="role">
									<div class="checkbox-inline">
										<input type="checkbox" name="rid" id="rid" value="${role.rid}" ${fn:contains(memberRoles,role.rid) ? "checked" : ""}>${role.title}
									</div>
								</c:forEach>
							</div> 
							<div class="col-md-4" id="ridMsg">*</div>
						</div> 
						<div class="form-group" id="lockedDiv">
							<label class="col-md-2 control-label" for="locked">用户状态：</label>
							<div class="col-md-5">
								<div class="radio-inline">
									<input id="locked" name="locked" type="radio" value="0" ${member.locked == 0 ? "checked" : ""}><span class="text-success">活跃</span>
								</div>
								<div class="radio-inline">
									<input id="locked" name="locked" type="radio" value="1" ${member.locked == 1 ? "checked" : ""}><span class="text-danger">锁定</span>
								</div>
							</div> 
							<div class="col-md-4" id="lockedMsg">*</div>
						</div> 
						<div class="form-group"> 
							<div class="col-md-offset-2 col-md-5">
								<input type="hidden" name="mid" id="mid" value="${member.mid}">
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
		<jsp:include page="/WEB-INF/pages/plugins/include_title_foot.jsp" />
		<!-- 导入右边工具设置栏 -->
		<jsp:include page="/WEB-INF/pages/plugins/include_menu_sidebar.jsp" />
		<div class="control-sidebar-bg"></div>
	</div>
	<jsp:include page="/WEB-INF/pages/plugins/include_javascript_foot.jsp" />
</body>
</html>

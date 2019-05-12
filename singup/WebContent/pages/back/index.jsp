<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<jsp:include page="/pages/plugins/include_javascript_head.jsp" />
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- 导入头部标题栏内容 -->
		<jsp:include page="/pages/plugins/include_title_head.jsp" />
		<!-- 导入左边菜单项 -->
		<jsp:include page="/pages/plugins/include_menu_item.jsp" />
		<div class="content-wrapper">
			<div class="panel panel-success">
				<div class="panel-heading">
					<strong><i class="fa fa-user-md"></i>&nbsp;用户中心</strong>
				</div>
				<div class="panel-body">
					<table class="table table-bordered table-hover">
						<tr>
							<td colspan="3"><span class="h1"><span class="glyphicon glyphicon-user"></span>&nbsp;欢迎光临！</span></td>
						</tr>
						<tr>
							<td rowspan="6" style="width:130px;">
								<img src="upload/news/nophoto.gif" class="image" style="height:128px;width:128px;">
							</td>
						</tr>
						<tr>
							<td style="width:20%"><strong>上次登录日期：</strong></td>
							<td>2020-10-12</td>
						</tr>
						<tr>
							<td><strong>总预约数量：</strong></td>
							<td>20</td>
						</tr>
						<tr>
							<td><strong>新的预约：</strong></td>
							<td>20</td>
						</tr>
						<tr>
							<td><strong>未处理预约：</strong></td>
							<td>20</td>
						</tr>
						<tr>
							<td><strong>已处理预约：</strong></td>
							<td>20</td>
						</tr>
					</table>
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

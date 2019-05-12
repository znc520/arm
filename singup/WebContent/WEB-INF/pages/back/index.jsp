<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/plugins/include_static_head.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<jsp:include page="/WEB-INF/pages/plugins/include_javascript_head.jsp" />
<script type="text/javascript" src="js/pages/back/index.js"></script> 
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- 导入头部标题栏内容 -->
		<jsp:include page="/WEB-INF/pages/plugins/include_title_head.jsp" />
		<!-- 导入左边菜单项 -->
		<jsp:include page="/WEB-INF/pages/plugins/include_menu_item.jsp" />
		<div class="content-wrapper">
			<div class="panel panel-success">
				<div class="panel-heading">
					<strong><i class="fa fa-user-md"></i>&nbsp;用户中心</strong>
				</div>
				<div class="panel-body">
					<table class="table table-bordered table-hover">
						<tr>
							<td colspan="3">
								<span class="h1"><span class="glyphicon glyphicon-user"></span>&nbsp;欢迎“<shiro:principal/>”光临！</span>
								<shiro:hasRole name="news">
									<shiro:hasPermission name="news:list">
										<button id="createNewsBut" class="btn btn-info btn-lg"><i class="fa fa-plus-circle"></i>&nbsp;生成公告信息列表</button>
									</shiro:hasPermission>
								</shiro:hasRole>
								<shiro:hasRole name="bespeak">
									<shiro:hasPermission name="bespeak:list">
										<button id="createBespeakBut" class="btn btn-success btn-lg"><i class="fa  fa-slideshare"></i>&nbsp;生成预约分类信息</button>
									</shiro:hasPermission>
								</shiro:hasRole> 
								
							</td>
						</tr>
						<tr> 
							<td rowspan="6" style="width:130px;">
								<img src="upload/news/nophoto.gif" class="image" style="height:128px;width:128px;">
							
							</td>
						</tr>
						<tr>
							<td style="width:15%"><strong>总预约数量：</strong></td>
							<td id="allBespeak"></td>
						</tr>
						<tr>
							<td><strong>新的预约：</strong></td>
							<td id="status0Bespeak"></td>
						</tr>
						<tr>
							<td><strong>已处理预约：</strong></td>
							<td id="status1Bespeak"></td>
						</tr>
						<tr>
							<td><strong>已废除预约：</strong></td>
							<td id="status2Bespeak"></td>
						</tr>
					</table>
				</div>
				<div class="panel-footer" style="height:80px;">
					<jsp:include page="/WEB-INF/pages/plugins/include_alert.jsp"/>
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

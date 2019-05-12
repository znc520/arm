<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/pages/plugins/include_static_head.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%
	String addNewsUrl = basePath + "pages/back/news/news_add.jsp" ;
	String editNewsUrl = basePath + "pages/back/news/news_edit.jsp" ;
%>
<jsp:include page="/pages/plugins/include_javascript_head.jsp" />
<script type="text/javascript" src="js/pages/back/news/news_list.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- 导入头部标题栏内容 -->
		<jsp:include page="/pages/plugins/include_title_head.jsp" />
		<!-- 导入左边菜单项 -->
		<jsp:include page="/pages/plugins/include_menu_item.jsp">
			<jsp:param name="role" value="news"/>
			<jsp:param name="action" value="news:${param.type }"/>
		</jsp:include>
		<div class="content-wrapper">
			<div class="panel panel-success">
				<div class="panel-heading">
					<c:if test="${param.type == 'list' }">
						<strong><i class="fa fa-list-ul"></i>&nbsp;已发布公告列表</strong>
					</c:if>
					<c:if test="${param.type == 'unlist' }">
						<strong><i class="fa fa-archive"></i>&nbsp;未发布公告列表</strong>
					</c:if>
				</div>
				<div class="panel-body">
					<jsp:include page="/pages/plugins/include_splitpage_search.jsp"/>
					<table class="table table-hover">
						<tr>
							<th width="5%" class="text-center"><input type="checkbox" id="selall"></th>
							<th width="50%" class="text-center">标题</th> 
							<th width="15%" class="text-center">发布者</th>
							<th width="15%" class="text-center">发布日期</th>
							<th width="10%" class="text-center">发布状态</th>
							<th width="5%" class="text-center">操作</th>
						</tr>
						<tr>
							<td class="text-center"><input type="checkbox" id="nid" name="nid" value="1"></td>
							<td class="text-center">我们要一起面对困难</td>
							<td class="text-center">admin</td>
							<td class="text-center">2019-10-10</td>
							<td class="text-center">已发布</td>
							<td class="text-center"><a href="<%=editNewsUrl%>" class="btn btn-xs btn-primary"><span class="glyphicon glyphicon-edit"></span>&nbsp;编辑</a></td>
						</tr>
					</table>
					<a href="<%=addNewsUrl%>" id="addBtn" class="btn btn-lg btn-primary"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;发布公告</a>
					<button id="removeBtn" class="btn btn-lg btn-danger"><span class="glyphicon glyphicon-remove"></span>&nbsp;删除公告</button>
					<jsp:include page="/pages/plugins/include_splitpage_bar.jsp"/>
				</div>
				<div class="panel-footer" style="height:80px;">
					<jsp:include page="/pages/plugins/include_alert.jsp"/>
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
